#!/bin/bash

# read in CSS files from the CSS directory
cssfiles=(./css/*.css)
IFS=$'\n' sorted=($(sort -V <<<"${cssfiles[*]}")); unset IFS

# find the file in the last position of the array
pos=$(( ${#sorted[*]} - 1 ))
last=${sorted[$pos]}

# loop through the files
for ((i=0; i<${#sorted[@]}; i++)); do
    # extract the version numbers
    first=$(echo ${sorted[$i]} | sed -e 's/.\/css\/govuk-frontend-//g' | sed -e 's/.css//g')
    second=$(echo ${sorted[$i+1]} | sed -e 's/.\/css\/govuk-frontend-//g' | sed -e 's/.css//g')
    
    # if not the last file in the array
    if [[ ${sorted[$i]} != $last ]]
    then
        # generate a diff with the next file
        git diff --no-index "${sorted[$i]}" "${sorted[$i + 1]}" > ./diff/diff-${first}--${second}.diff
    fi
done
