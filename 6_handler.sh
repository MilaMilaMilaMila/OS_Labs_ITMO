#!/bin/bash

result=1
operation="+"

terminate() {
    echo work finished full
    exit 0
}

plus() {
    operation="+"
}

asterisk() {
    operation="."
}

minus() {
    operation="-"
}

division() {
    operation="/"
}

trap 'terminate' SIGTERM
trap 'plus' USR1
trap 'asterisk' USR2
trap 'minus' SIGALRM
trap 'division' SIGBUS

while true; do
    case $operation in
        "+")
            let "result+=2"
        ;;
        ".")
            let "result*=2"
        ;;
        "-")
            let "result-=2"
        ;;
        "/")
            let "result/=2"
        ;;
    esac
    sleep 1
    echo $result
done