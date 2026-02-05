#!/bin/bash

# This shell script only accept 1 argument

input_file="emails.txt"
[ -f "$input_file" ] || { echo "File doesn't exist"; exit 1; }

grep -E "^[a-zA-Z0-9]+@[a-zA-Z]+\.com$" "$input_file" > temp_valid.txt

grep -vE "^[a-zA-Z0-9]+@[a-zA-Z]+\.com$" "$input_file" > invalid.txt

sort temp_valid.txt | uniq > valid.txt

echo "valid.txt and invalid.txt created"

# End of script
