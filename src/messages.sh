#!/bin/bash

msg_error_input_option() {
	echo "leake: $(tput setaf 1)error$(tput sgr 0): unrecognized command line option" ${1} ${2}
}

msg_warning_no_config() {
	echo "leake: $(tput setaf 4)config.lk$(tput sgr 0): no config file"
}


msg_warning_config_create() {
	echo "leake: $(tput setaf 4)config.lk$(tput sgr 0): created"
}

msg_error_compilation() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): compilation error"
}

msg_error_compiler() {
	echo "leake: $(tput setaf 1)error$(tput sgr 0):" ${1}
}

msg_done_execute_after_compile() {
	echo "leake: $(tput setaf 2)done$(tput sgr 0): new release done, start application"
}

msg_error_cannot_install() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): cannot install. try #sudo ./leake --install"
}

msg_error_cannot_remove() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): cannot remove. try #sudo leake --remove"
}

msg_error_uninstall_generic(){
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): generic error during uninstall"
}

msg_error_config_version() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): version must be declared in config.lk"
}

msg_error_config_name() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): name must be declared in config.lk"
}

msg_error_no_file() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): no source files"
}

msg_error_git_not_exists() {
	echo "leake: $(tput setaf 1)fatal error$(tput sgr 0): cannot update. git does not exists"
}
