#!/bin/bash
# Version 1.0.0
###################################################################################################
#    parses log files and txt files into a csv file

##############################################################
# grabInfo()
# finds the sentence given within the variables search[0-3]
# and grabs the last found location of the matched sentence
# if a search variable is "", function will skip that search
##############################################################
# variables used to search within the files
# variables with "" are considered empty & will be skipped
##############################################################
search0="cat"
search1="I am a"
search2="pizza"
search3=""
grabInfo() {
  if [[ ${search0} != "" ]]; then
    info0="$(grep "${search0}" $(pwd)/${fileParsed} | tail -1)"
    if [[ ${info0} == "" ]]; then info0="Not Found"; fi
  fi

  if [[ ${search1} != "" ]]; then
    info1="$(grep "${search1}" $(pwd)/${fileParsed} | tail -1)"
    if [[ ${info1} == "" ]]; then info1="Not Found"; fi
  fi

  if [[ ${search2} != "" ]]; then
    info2="$(grep "${search2}" $(pwd)/${fileParsed} | tail -1)"
    if [[ ${info2} == "" ]]; then info2="Not Found"; fi
  fi

  if [[ ${search3} != "" ]]; then
    info3="$(grep "${search3}" $(pwd)/${fileParsed} | tail -1)"
    if [[ ${info3} == "" ]]; then info3="Not Found"; fi
  fi
  fileName="(File Name = ${fileParsed})"
}
##############################################################
# Adds collected data into a csv file called
##############################################################
searchSentence=""
searchSentPrinted=false
addIntoCsv() {
  outputSentence=""
  if [[ ${search0} != "" ]]; then
    searchSentence="Searching ${search0}"
    outputSentence="${info0}"
  fi  
  if [[ ${search1} != "" ]]; then
    searchSentence=$(printf "%-25s | %-5s %-25s" "${searchSentence}" "" "Searching ${search1}")
    outputSentence=$(printf "%-25s | %-5s %-25s" "${outputSentence}" "" "${info1}")
  fi
  if [[ ${search2} != "" ]]; then
    searchSentence=$(printf "%-25s | %-5s %-25s" "${searchSentence}" "" "Searching ${search2}")
    outputSentence=$(printf "%-25s | %-5s %-25s" "${outputSentence}" "" "${info2}")
  fi
  if [[ ${search3} != "" ]]; then
    searchSentence=$(printf "%-25s | %-5s %-25s" "${searchSentence}" "" "Searching ${search3}")
    outputSentence=$(printf "%-25s | %-5s %-25s" "${outputSentence}" "" "${info3}")
  fi
  if [[ ${searchSentPrinted} == false ]]; then
      searchSentPrinted=true
      echo "${searchSentence}" >> ${csvFile}
  fi
  outputSentence=$(printf "%-10s - %-25s" "${outputSentence}" "${fileName}")
  echo "${outputSentence}" >> ${csvFile}
}

cd `pwd`                    #cd into current directory
csvDate=`date +"%Y%m%d"`    #grab current date
##############################################################
# csv file will be called 'output_currentdate.csv'
# If csv file already exists, it will continue to add data into the file
# Else, create new file with current date
##############################################################
if [[ -f "output_${csvDate}.csv" ]]; then
  csvFile="output_${csvDate}.csv"
else
  touch "output_${csvDate}.csv"
  csvFile="output_${csvDate}.csv" ;
fi
########################
# Start Parsing Files
# that end with .txt
########################
counter=0
amount=$(echo $(ls *.txt | wc -l))
if [[ ${amount} > 0 ]]; then
  echo "Parsing txt files"
while [ ${amount} -ge "1" ]; do
  fileParsed=$(ls -rt *.txt | head -n ${amount} | tail -n 1)
  grabInfo
  addIntoCsv
  counter=`expr ${counter} + 1`
  amount=`expr ${amount} - 1`
done
fi
echo "${counter} files have been parsed, ${csvFile} is the output csv file"
