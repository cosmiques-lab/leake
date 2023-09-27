#!/bin/bash

get_version_number() {
	echo $leake_version
}

increment_number() {
	[[ ${1} =~ ^(.*[^0-9])?([0-9]+)$ ]]  && \
	[[ ${#BASH_REMATCH[1]} -gt 0 ]] && \
	    printf "%s%0${#BASH_REMATCH[2]}d" "${BASH_REMATCH[1]}" "$((10#${BASH_REMATCH[2]} + 1 ))" || \
	    printf "%0${#BASH_REMATCH[2]}d" "$((10#${BASH_REMATCH[2]} + 1))" || \
		printf "${1}"
}

load_config_var() {
	t_version=$(cat config.lk | grep VERSION=* | cut -c 9-59) 
	if [[ $t_version = "" ]];
	then
		msg_error_config_version
		exit -1
	else
		VERSION=$t_version
	fi

	t_name=$(cat config.lk | grep NAME* | cut -c 6-106)
	if [[ $t_name = "" ]];
	then
		msg_error_config_name
		exit -1
	else
		NAME=$t_name
	fi

	# NOTES
	t_notes=$(cat config.lk | grep  NOTES* | cut -c 7-107)
	if [[ ! $t_notes = "" ]];
	then
		NOTES=$t_notes
	fi

	# delete old release
	t_del_ex_rel=$(cat config.lk | grep DEL_EX_REL* | cut -c 12-12)
	if [[ !($t_del_ex_rel = "" || $t_del_ex_rel = "n") ]];
	then
		DEL_EX_REL=$t_del_ex_rel
	fi

	# DISPLAY_VERSION_NAME
	t_display_vn=$(cat config.lk | grep DISPLAY_VN* | cut -c 12-12)
	if [[ !($t_display_vn = "" || $t_display_vn = "n") ]];
	then
		DISPLAY_VN=$t_display_vn
	fi

	# COMPILER
	t_compiler=$(cat config.lk | grep COMPILER* | cut -c 10-20)
	if [[ ! $t_compiler = "" ]];
	then
		COMPILER=$t_compiler
	fi

	# C_OPTION
	t_c_option=$(cat config.lk | grep C_OPTION* | cut -c 10-30)
	if [[ ! $t_c_option = "" ]];
	then
		C_OPTION=$t_c_option
	fi

	# DELETE_O
	t_delete_o=$(cat config.lk | grep DELETE_O* | cut -c 10-10)
	if [[ !($t_delete_o = "" || $t_delete_o = "n") ]];
	then
		DELETE_O=$t_delete_o
	fi

	# EXECUTE
	t_execute=$(cat config.lk | grep EXECUTE* | cut -c 9-9)
	if [[ !($t_execute = "" || $t_execute = "n") ]];
	then
		EXECUTE=$t_execute
	fi

	# SOURCE_FILE
	t_source_file=$(cat config.lk | grep SOURCE_FILE* | cut -c 13-23)
	if [[ ! $t_source_file = "" ]];
	then
		SOURCE_FILE=$t_source_file
	fi

	# HEADER_FILE
	t_header_file=$(cat config.lk | grep HEADER_FILE* | cut -c 13-23)
	if [[ ! $t_header_file = "" ]];
	then
		HEADER_FILE=$t_header_file
	fi
}
