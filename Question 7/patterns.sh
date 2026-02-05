#!/bin/bash

# This shell script only accept 1 argument

[ "$#" -eq 1 ] || { echo "Please pass 1 arugumnet only which should be a file"; exit 1; }

[ -f "$1" ] || echo "Please provide a file only"

word=$(cat "$1" | tr -d [:punct:] | tr -s ' ' '\n' | grep -v '^$')

echo "$word" | grep -Ei '^[aeiou]+$' > vowels.txt
echo "vowels.txt created"

echo "$word" | grep -Ei '^[^aeiou]+$' > consonants.txt
echo "consonants.txt created"

echo "$word" | grep -Ei '^[^aeiou][a-z]*[aeiou][a-z]*$' > mixed.txt
echo "mixed.txt created"

# End of script
