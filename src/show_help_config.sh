#!/bin/bash

show_help_config() {
	echo ""
	echo "Usage of config.lk file"
	echo "	VERSION=M.m.r			*must have				[50 char]"
	echo "	NAME=name_of_compiled	*must have				[100 char]"
	echo "	NOTES=notes...			OPTIONAL default ""		[100 char]"
	echo "	DISPLAY_VN=y			OPTIONAL default n		[1 char]=n/y"
	echo "	COMPILER=gcc			OPTIONAL default gcc	10 char]"
	echo "	C_OPTION=-o             OPTIONAL default -o 	[20 char]"
	echo "	DELETE_O=y				OPTIONAL default y		[1 char n/y"
	echo "	EXECUTE=yes             OPTIONAL default n		[1 char y/n]"
	echo "	SOURCE_FILE=c			OPTIONAL default c		[10 char]"
	echo "	HEADER_FILE=h			OPTIONAL default h		[10 char]"	
	echo "	DEL_EX_REL=y			OPTIONAL default n		n/y"

	echo ""

	echo "Meaning of commands"
	echo "Command					Meaning												Status"
	echo "VERSION					Actual version of software								"
	echo "NAME						Final name for compiled									"
	echo "NOTES						Notes of project									TODO"
	echo "DISPLAY_VN				Display version name in compiled						"
	echo "COMPILER					Choose your compiler gcc, g++, javac ecc				"		
	echo "C_OPTION					Choose option for compiler like -o						"
	echo "DELETE_O					Delete *.o files										"
	echo "EXECUTE					Execute compiled after execution of leake				"
	echo "SOURCE_FILE				Extension for source file like c or cpp				TODO"
	echo "HEADER_FILE				Extension for header file like h or hpp	or nothing	TODO"
	echo "DEL_EX_REL				Delete old release after a new release					"
}
