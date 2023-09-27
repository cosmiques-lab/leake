#!/bin/bash

compile() {
	# create tmp folder to save new compiled
	$(mkdir -p tmp/new)

	c_compiler=${1}
	c_option=${2}
	c_source_file=${3}
	c_header_file=${4}

	# add compiler
	c_str=$c_compiler
	c_str+=" "

	source_to_find=".*\."$c_source_file"$"
	header_to_find=".*\."$c_header_file"$"

	# add c file
	for f in $(find . | grep $source_to_find)
	do
		c_str+=$f
		c_str+=" "
	done

	#add header file
	for h in $(find . | grep $header_to_find)
	do
		c_str+=$h
		c_str+=" "
	done

	# add compiler option
	c_str+=$c_option

	# add default output file name
	c_str+=" tmp/new/out"

	#execute compiler!
	compiler_out=$($c_str)

	if [[ ! $compiler_out = $empty_string ]];
	then
		echo msg_error_compiler $compiler_out
	fi
	exit
}

update_version() {
	type=${1}

	v_maj=$(echo $t_version | cut -d "." -f 1)
	v_min=$(echo $t_version | cut -d "." -f 2)
	v_reb=$(echo $t_version | cut -d "." -f 3)

	if [[ $type = $opt_long_compile_rebuild ]];
	then
		v_reb=$(increment_number $v_reb)
	elif [[ $type = $opt_long_compile_release ]];
	then
		v_reb=0
		v_min=$(increment_number $v_min)
	elif [[ $type = $opt_long_compile_final ]];
	then
		v_reb=0
		v_min=0
		v_maj=$(increment_number $v_maj)
	fi

	echo $v_maj"."$v_min"."$v_reb
}

start() {
	current_version=$1
	compile_type=$2	# compile
					# rebuild
					# release
					# final

	compile_ret=$(compile ${3} ${4} ${5} ${6})

	if [[ $compile_ret = $empty_string ]];
	then
		if [[ $compile_type = $opt_long_compile_compile ]];
		then
			delete_release $current_version
		fi

		new_version=$(update_version $compile_type)

		post_release $new_version ${7} ${8} ${9}
	else
		echo msg_error_compilation
		echo $compile_ret
	fi

	clean
}

post_release() {
	new_version=${1}
	delete_old_release=${2}
	delete_o_files=${3}
	execute_after=${4}

	if [[ $delete_old_release = $yes ]];
	then
		if [[ -d "$folder_release" ]];
		then
			rm -r release/
		fi
	fi

	str_name=$(get_name_of_compiled $new_version)

	mkdir -p release/$new_version
	cp -r tmp/new/out release/$new_version/$str_name

	if [[ $delete_o_files = $yes ]];
	then
		o_str="rm -r "

		i=0
		for o in $(find . | grep ".*\.o$")
		do
			o_str+=$o
			o_str+=" "
			i+=1
		done

		if [[ $i > 0 ]];
		then
			$($o_str)
		fi
	fi

	if [[ $execute_after = $yes ]];
	then
		e_str="./release/$new_version/$str_name &"

		msg_done_execute_after_compile
		echo $($e_str)
	fi

	new_config_for_release $new_version
}
