#!/bin/bash

# This shell script  read student file and do operations on it

r_file="marks.txt"

[ -f "$r_file" ] || { echo "File doesn't exist"; exit 1; }


pass=0
pass_1=0

declare -a passed_stud
declare -a only_1_pass

while IFS=, read -r r_no name M1 M2 M3 
do

flag=0

(( M1 > 33 )) && (( flag++ ))
(( M2 > 33 )) && (( flag++ ))
(( M3 > 33 )) && (( flag++ ))
 
(( flag == 3 )) && { (( pass++ )); passed_stud+=(" $r_no $name ");  }
(( flag == 2 )) && { (( pass_1++ )); only_1_pass+=(" $r_no $name "); }

done < "$r_file"

echo "Students who failed in exactly ONE subject: $pass_1"
for n in "${only_1_pass[@]}"
do
echo "$n"
done

echo "Students who passed in ALL subjects: $pass"
for m in "${passed_stud[@]}"
do
echo "$m"
done

# End of script
