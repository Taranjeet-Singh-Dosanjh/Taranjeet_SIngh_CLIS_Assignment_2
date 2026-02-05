#!/bin/bash

# This shell script  accept a directory path

[ "$#" -eq 1 ] || { echo "Please provide only 1 argument which should be a directory"; exit 1; }

mkdir -p "$1/backup"

echo "Moving files in $1 (PID: $$)"
for m_files in "$1"/*
do

[ -f "$m_files" ] &&  mv "$m_files" "$1/backup/" &
echo "Moving $(basename "$m_files") PID: $!"

done
wait

echo "Moving completes"
# End of script
