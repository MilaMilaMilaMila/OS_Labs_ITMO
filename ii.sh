 #!/bin/bash

allStrings=""
a=""

while [[ "$a" != "q" ]]
    do
        read a
        if [[ "$a" == "q" ]]; then echo $allStrings && break; else allStrings="$allStrings$a"; fi;
    done
