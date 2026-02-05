#!/bin/bash

# This shell script only accept 1 argument which is a file

[ "$#" -eq 1 ] &&  [ -e "$1" ] ||  { echo "Please provide only 1 argument, which should be a log file";  exit 1; }
[ -r "$1" ] && [ -f "$1" ]|| { echo "Please provide a redable file";  exit 1; }

r_date=$(date +%Y-%m-%d);
r_file="logsummary_${r_date}.txt"
touch "$r_file"

echo "Total log entries: `grep -c "." "$1" | wc -l`"| tee -a "$r_file" 
echo "INFO: `grep -o "INFO" "$1" | wc -l` ERROR: `grep -o "ERROR" "$1" | wc -l` WARNING: `grep -o "WARNING" "$1" | wc -l`" | tee -a "$r_file"
tac "$1" | grep -m 1 "ERROR" | sed 's/.*ERROR //'| tee -a "$r_file" 

# End of script
