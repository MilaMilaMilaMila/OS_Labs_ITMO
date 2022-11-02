 #!/bin/bash

PS3="Введите число: "

option1="open Nano"
option2="open Vi"
option3="open Links"
option4="exit"

select character in "$option1" "$option2" "$option3" "$option4"
do
    case "$character" in
        "$option1" ) nano textFile.txt;;
        "$option2" ) vi textFile.txt;;
        "$option3" ) links;; #ctrl c
        "$option4" ) echo "You exited from menu" && break;;
    esac
done
