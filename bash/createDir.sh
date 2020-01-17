#!/bin/bash
#######################################################
# Function to create a directory
# 1st passing parameter is the name of a directory
# that wants to be created
#######################################################
# if the directory is already created, it will output
# an error message
#######################################################

createDir() {
	if [[ "$1" =~ ^[A-Za-z_+0-9]+$ ]]; then
		if [ ! -d "$1" ]; then
			mkdir "$1"
		fi
		else
			echo -e "directory already exists\n"
	fi
}
