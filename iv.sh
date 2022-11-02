 #!/bin/bash

echo "" > info.txt

for pid in $(ps -A -o pid | tail -n +2)

do


file="/proc/"$pid"/status"

file1="/proc/"$pid"/sched"

ppid=$(grep -E -h -s -i "ppid:\s(.+)" $file | grep -o "[0-9]\+")
time1=$(grep -E -h -s -i "se.sum_exec_runtime\s(.+):\s(.+)" $file1 | grep -o "[0-9]\+\.*[0-9]*") 
time2=$(grep -E -h -s -i "nr_switches\s(.+):\s(.+)" $file1 | grep -o "[0-9]\+\.*[0-9]*")

if [ -z $ppid ];
then
	ppid=0
fi
if [ -z $time1 ] || [ -z $time2 ];
then
	art=0
else
	art=$(echo "scale=2; $time1/$time2" | bc | awk '{printf "%.2f", $0}')
fi
echo "$pid $ppid $art"

done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' > mid4.txt

