#!/bin/bash

echo "$$" > report1.log

cnt=0
declare -a array
declare -a numbers=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# cur_seconds=$(date +%s)

while true
do
    array+=(${numbers[@]})
    cnt=$((cnt+1))

    if [[ "$cnt" == "100000" ]] 
    then

        echo "${#array[@]}" >> report1.log
        cnt=0

    fi

done

