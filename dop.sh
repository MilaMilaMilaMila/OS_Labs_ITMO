#!/bin/bash
echo "" > newFile.txt

a=`cat file.txt`

for((i=1;$i<${#a};i+=2)); do echo ${a:$i:1} >> newFile.txt; done

