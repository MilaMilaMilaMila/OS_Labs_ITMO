 #!/bin/bash

answ=0
answPid=0

for pid in $(ps -A -o pid | tail -n +2)

do

file="/proc/"$pid"/status"
# echo $(grep -i VMSIZE $file)

mem=$(grep -E -h -s -i "vmsize:\s(.+)" $file | grep -o "[0-9]\+")
# cat $file | grep -i VMSIZE >> findMax.txt

if [[ $mem -ne "" ]];
then
	if [[ $mem -gt "$answ" ]];
	then
		answPid=$pid
		answ=$mem
	fi
fi

done

echo "Using /proc : Process_PID="$answPid" Memory="$answ"" > max_memory.txt
top -bo RES | head -n8 | tail -n1 | awk '{print "Using top : Process_PID="$1" Memory="$6}' >> max_memory.txt
