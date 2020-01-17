#!/bin/bash
#Function to replace a line within a file
# 1st passing parameter = characters/sentence that will be inserted
# 2nd passing parameter = characters/sentence that will be replaced 
# 3rd passing parameter = file that will be modified

#######################################################
# if 1st parameter is 'clear'
# find 2nd parameter within 3rd paramter(must be a file)
# and remove the 2nd parameter from the file
#######################################################
lineReplacement() {
if [[ "$1" == "clear" ]]; then
  if grep -q "$2" "$3"
  then
    sed -i 's#.*'"$2"'.*#'""'#' "$3"
    sed -i '/^\s*$/d' "$3"
  fi
#######################################################
# if 1st parameter is not 'clear'
# find 2nd parameter within 3rd paramter(must be a file)
# and replace the 2nd parameter with the 1st parameter
#######################################################
else
  echo "" >> "$3"
  echo "" >> "$3"
  sed -i '/^\s*$/d' "$3"
    if grep -q "$2" "$3"
    then
      sed -i 's#.*'"$2"'.*#'"$1"'#' "$3"
#######################################################
# if 2nd parameter does not exist
# add 1st parameter into 3rd parameter(must be a file)
#######################################################
    else
      sed -i '/^\s*$/d' "$3"
      echo "$1" >> "$3"
  fi
fi
}
