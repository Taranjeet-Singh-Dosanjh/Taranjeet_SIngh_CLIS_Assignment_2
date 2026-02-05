#!/bin/bash


# This shell script checks input.txt file
m_file="input.txt"

[ -f "$m_file" ] || { echo "input.txt doesn't exist"; exit 1; } 

word=$(cat "$m_file" | tr -d [:punct:] | tr -s ' ' '\n')


echo "Longest word: "
echo "$word" | awk '{print length, $0}' | sort -nr | head -1 | awk '{print $2}'

echo -e "\nShortest word: "
echo "$word" | awk '{print length, $0}' | sort -n | head -1 | awk '{print $2}'

echo -e "\nAverage word length: "
echo "$word" | awk '{ add += length($0); i++ } END { if ( i > 0 ) print add / i }'  

echo -e "\nToatal number of uniq words:"; echo "$word" | sort | uniq | wc -w

# End of script
