#!/bin/bash

declare -a array
declare -a numbers=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

while true
do
    array+=(${numbers[@]})
    cnt=$((cnt+1))

    if [[ "${#array[@]}" -gt "$1" ]] 
    then

        echo "stop"
        exit 0

    fi

done

