#!/bin/bash
cd `pwd`
var=$(echo $(ls *.txt | wc -l))
#var=$(echo ${var})
if [[ ${var} == 4 ]]; then
echo "yes"
fi
echo ${var}
