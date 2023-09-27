#!/bin/bash

# leake constant
leake_version=1.4.0
leake_author="bodhi"
leake_email="bodhi4165@gmail.com"
leake_website="github.com/bodhi4165/leake"

#for release update
release_format=".tar.gz"
release_url="/archive/refs/tags/"

# config.lk default constants
NOTES=""
DISPLAY_VN="n"
COMPILER="gcc"
C_OPTION="-o"
DELETE_O="y"
EXECUTE="n"
SOURCE_FILE="c"
HEADER_FILE="h"
DEL_EX_REL="n"
VERSION=""
NAME=""

# input option
opt_help="-h"
opt_clear="-c"
opt_install="-i"
opt_remove="-r"
opt_update="-u"
opt_version="-v"
opt_compile="-s"
opt_long_help="--help"
opt_long_help_config="--config"
opt_long_clear="--clear"
opt_long_install="--install"
opt_long_remove="--remove"
opt_long_update="--update"
opt_long_version="--version"
opt_long_version_number="--version-number"
opt_long_compile="--start"
opt_long_compile_compile="--compile"
opt_long_compile_rebuild="--rebuild"
opt_long_compile_release="--release"
opt_long_compile_final="--final-release"

# filenames
file_config="config.lk"
folder_release="release/"
#
emtpy_string=""
yes="y"
no="n"
