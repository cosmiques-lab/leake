#!/bin/bash


. dependency.sh

if [[ $1 = $opt_help || $1 = $opt_long_help ]];
then
	if [[ $2 = $opt_long_help_config ]];
	then
		show_help_config
	else
		show_help
	fi
elif [[ $1 = $opt_clear || $1 = $opt_long_clear ]];
then
	clean_release
elif [[ $1 = $opt_install || $1 = $opt_long_install ]];
then
	installer
elif [[ $1 = $opt_remove || $1 = $opt_long_remove ]];
then
	uninstall
elif [[ $1 = $opt_version || $1 = $opt_long_version ]];
then
	show_info ## todo change in show_version
elif [[ $1 = $opt_long_version_number ]];
then
	get_version_number
elif [[ $1 = $opt_compile || $1 = $opt_long_compile ]];
then
	option=${2}

	if [[ ! ($2 = $opt_long_compile_rebuild
			|| $2 = $opt_long_compile_release
			|| $2 = $opt_long_compile_final
			|| $2 = $opt_long_compile_compile
			|| $2 = $empty_string) ]];
	then
		msg_error_input_option $opt_long_compile $option
	else
		if [[ ! -f $file_config ]];
		then
			msg_warning_no_config
			init_config
			msg_warning_config_create
		fi

		if [[ $option = $empty_string ]];
		then
			option=$opt_long_compile_compile
		fi

		# load var from config.lk
		load_config_var

		num_files=$(check_for_files $SOURCE_FILE)
		if [[ $num_files = "0" ]];
		then
			msg_error_no_file
		else
			start $VERSION $option $COMPILER $C_OPTION $SOURCE_FILE $HEADER_FILE $DEL_EX_REL $DELETE_O $EXECUTE
		fi
	fi
else
	msg_error_input_option $1
fi

