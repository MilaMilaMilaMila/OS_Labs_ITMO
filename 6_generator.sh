#!/bin/bash

while true; do
    read line
    case $line in
        "TERM")
            kill -SIGTERM $1
            echo work finished
            sleep 1
            exit 0
        ;;
        "+")
            kill -USR1 $1
        ;;
        ".")
            kill -USR2 $1
        ;;
        "-")
            kill -SIGALRM $1
        ;;
        "/")
            kill -SIGBUS $1
        ;;
    esac
done