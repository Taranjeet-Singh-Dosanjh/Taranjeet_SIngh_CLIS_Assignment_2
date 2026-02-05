#!/bin/bash

# This shell script accept 2 argument which are directories

[ "$#" -eq 2 ] || { echo "Please provide 2 arugumnets which should be directories. "; exit 1; }

dir1="${1%/}/"
dir2="${2%/}/"

[ -d "$1" ] && [ -d "$2" ] || { echo "Argument provided are not directories. "; exit 1; }

echo -e "\nFiles present only in dirA: "

diff -rq "$dir1" "$dir2" | grep -Po "$dir1: \K.*"

echo -e "\nFiles present only in dirB: "
diff -rq "$dir1" "$dir2" | grep -Po "$dir2: \K.*"


echo -e "\n common files"
for m_file in "$dir1"/*
do

file_name=$(basename "$m_file");

[ -f "$dir2$file_name" ] || cmp -s "$m_file" "$dir2$file_name" && echo "$file_name"

done
# End of script
