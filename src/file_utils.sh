#!/bin/bash

#test on develop
# create new config.lk with new release version
# usage:
#	 new_config_for_release 1.2.3
# 		where 1.2.3 is new release version number
new_config_for_release() {
	touch config.lk config_new.lk

	filename="$file_config"

	while read -r line; 
	do
		row="$line"
		row_version=$(echo $row | cut -c 1-7)

		if [[ ! $row_version = "VERSION" ]];
		then
			echo $row >> config_new.lk
		fi
    done < "$filename"

	rm -r config.lk
	mv config_new.lk config.lk

	new_version=${1}

	echo "VERSION=$new_version" >> config.lk
}

# delete release folder
# usage:
#    delete_release 1.2.0
#	    where 1.2.0 is folder to delete: release/1.2.0/
delete_release() {
	version_to_del=$1

	if [[ -d "release/$version_to_del" ]];
	then
		$(rm -r release/$version_to_del)
	fi
}

clean_release() {
	if [[ -d "release/" ]];
	then
	 	$(rm -r release/)
	fi
}

clean() {
	$(rm -r tmp/)
}

#get name of compiled!
get_name_of_compiled() {
	new_version=${1}
	str_name=$NAME

	if [[ $DISPLAY_VN = "y" ]];
	then
		str_name+=$new_version
	fi

	echo $str_name
}

init_config(){
	if [[ ! -f "config.lk" ]];
	then
		echo "NAME=out" > config.lk
		echo "VERSION=1.0.0" >> config.lk
	fi
}

check_for_files() {
	extension=$1

	str=".*\."$extension"$"

	num_of_files=$(find . | grep $str | wc -l)

	echo $num_of_files
}
