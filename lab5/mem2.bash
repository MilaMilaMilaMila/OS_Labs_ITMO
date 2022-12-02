#!/bin/bash

echo "$$" > report2.log

cnt=0
declare -a array
declare -a numbers=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# cur_seconds=$(date +%s)

while true
do
    array+=(${numbers[@]})
    cnt=$((cnt+1))
    # next_seconds=$(date +%s)

    # echo $cnt

    if [[ $cnt == 100000 ]] 
    then

        echo "${#array[@]}" >> report2.log
        cnt=0

    fi

    # if [[ $cur_seconds != $next_seconds ]] 
    # then

    #     # echo $cur_seconds $next_seconds 

    #     cur_seconds=$next_seconds
    #     top -b -n 1 | head -12 | tail -9 >> top_report.txt

    # fi

done