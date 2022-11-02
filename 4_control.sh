#!/bin/bash

read first_pid

cur_nice=$(top -n 1 -b -p "$first_pid" | sed 1,7d | awk '{print $4}')

get_cur_percents() {
    top -n 1 -b -p "$first_pid" | sed 1,7d | awk '{print $9}'
}

do_renice() {
    while true;
    do
        cur_percents="$(get_cur_percents "$first_pid")"
        if (( $(echo "$cur_percents > 10" | bc -l) ));
        then
            (( ++cur_nice ))
            renice -n "$cur_nice" -p "$first_pid"
        else
            break
        fi
    done            
}

while true;
    do
    cur_percents="$(get_cur_percents "$first_pid")"
    if (( $(echo "$cur_percents > 10" | bc -l) ));
    then
        do_renice "$first_pid"
    fi
    sleep 1s
done        