#!/bin/bash

####################################################################
# this function creates a directory called "filesDir"
# if it does not exist
####################################################################
createDir() {
	if [[ ! -d "$1/filesDir" ]]; then
		mkdir $1/filesDir
	else
		echo "Folder is there"
	fi
}

####################################################################
# a for loop to print data into a file 
# parameter 1 passes a sentence while parameter 2 passes a filename
####################################################################
forLoopFile() {
for ((i=0;i<1;i++)); do
	echo "$1" >> $2
done
}

####################################################################
# Function to create the 4 txt files if they do not exist
# checks if each file is created
####################################################################
createFiles() {
if [[ ! -f "$1/pizza.txt" || ! -f "$1/cat.txt" || ! -f "$1/dog.txt" || ! -f "$1/car.txt" ]]; then
	if [[ ! -f "$1/dog.txt" ]]; then
		forLoopFile "I am a dog" "$1/dog.txt"
	fi
	if [[ ! -f "$1/cat.txt" ]]; then
		forLoopFile "I am a cat" "$1/cat.txt"
	fi
	if [[ ! -f "$1/car.txt" ]]; then
		forLoopFile "I am a car VROOM VROOM" "$1/car.txt"
	fi
	if [[ ! -f "$1/pizza.txt" ]]; then
		forLoopFile "I am a pizza" "$1/pizza.txt"
	fi
else
	echo "files are there"
fi
}
createFiles $(pwd)

####################################################################
# function to check user input
# q or Q will exit and restart the selection
# 1 - 10 will exit and accept the user input
# anything else will exit and return 13 which is an error code
####################################################################
menuOption() {
defaultSen="Please choose an option from 1 - 10 for which line you want to replace
or [q/Q] to restart selection: "
read -p "${defaultSen}" option
if [ ${option} == "q" ] || [ ${option} == "Q" ]; then
		echo 99
elif [[ ${option} -le 10 ]] && [[ ${option} -ge "1" ]]; then
	echo ${option}
else
	echo 13
fi
}

####################################################################
# read the files within $(pwd)/filesDir
# print them out in a list for the user to see the options
####################################################################
printFiles() {
cd $1
i=0
echo "|Entry|-------------------Menu Option----------------------"
echo "-----------------------------------------------------------"
for file in *
  do
  	echo "| ${i} |  ${file}"
    i=`expr ${i} + 1`
done
echo "-----------------------------------------------------------"
cd $2
}

####################################################################
# asks user to input a character or sentence or word to
# replace the line that was selected within the selected file
# each replacement will be recorded into logFile.dat
####################################################################
lineReplacement() {
read -p "Please enter a sentence or word or character to to swap line $2 in $1:
" sentence
sed -i '' -e ''"${2}"'s/.*/'"${sentence}"'/' "${folderDir}/$1"
echo "$1 in line $2 has been swapped with \"${sentence}\"" >> logFile.dat
}
