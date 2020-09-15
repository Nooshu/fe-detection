#!/bin/bash

# read in CSS files from the CSS directory
cssfiles=(./css/*.css)

# find the file in the last position of the array
pos=$(( ${#cssfiles[*]} - 1 ))
last=${cssfiles[$pos]}

# loop through the files
for ((i=0; i<${#cssfiles[@]}; i++)); do
    # extract the version numbers
    first=$(echo ${cssfiles[$i]} | sed -e 's/.\/css\/govuk-frontend-//g' | sed -e 's/.css//g')
    second=$(echo ${cssfiles[$i+1]} | sed -e 's/.\/css\/govuk-frontend-//g' | sed -e 's/.css//g')
    
    # if not the last file in the array
    if [[ ${cssfiles[$i]} != $last ]]
    then
        # generate a diff with the next file
        git diff --no-index "${cssfiles[$i]}" "${cssfiles[$i + 1]}" > ./diff/diff-${first}--${second}.diff
    fi
done
