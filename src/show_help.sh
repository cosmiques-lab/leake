#!/bin/bash

show_help() {
	echo "Usage: leake [OPTION] [COMMAND]                                                               "
	echo ""
	echo "option            GNU long option    meaning									        "
	echo "   -s <command>   --start            compile and create new release					"
	echo "   -h <type>      --help             show help menu									"
	echo "   -v             --version          display info page								"
	echo "   -i             --install          install in /usr/bin								"
	echo "   -u             --update           force check for updates 						"
	echo "   -r             --remove           unistall from /usr/bin and remove all component "
	echo "   -c             --clear            clean all release folders"
 	echo ""
	echo "example of --help command"
	echo "   leake -h                          display this menu"
	echo "   leake -h --config                 show helps for config.lk file"
	echo ""
	echo "meaning of command"
	echo "   leake --start --compile           recompile without creating of new release"
	echo "   leake --start --rebuild           from 1.0.0 create 1.0.1 and compile"
	echo "   leake --start --release           from 1.0.1 create 1.1.0 and compile"
	echo "   leake --start --final-release     from 1.1.0 create 2.0.0 and compile"
}
