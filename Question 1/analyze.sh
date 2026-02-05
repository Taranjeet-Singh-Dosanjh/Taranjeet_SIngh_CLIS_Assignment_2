#!/bin/bash

# This shell script only accept 1 argument

[ $# -eq 1 ] && echo "1 Argument Passed" || { echo "Please pass exactly 1 Argument"; exit 1; }

[ -e "$1" ] || { echo "Path to $1 does not exist"; exit 1; }

if [ -f "$1" ]
then
wc "$1"
elif [ -d "$1" ]
then
find ./"$1" -maxdepth 1 -type f | wc -l
ls -l ./"$1" | grep ".txt$" | wc -l
fi
# End of script
