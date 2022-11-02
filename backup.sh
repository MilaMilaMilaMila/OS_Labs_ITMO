#!/bin/bash

backupParentDir="$HOME/"
sourceDir="$HOME/source/"

dircreated=0

backupPrefix="Backup-"
backupReport="$HOME/backup-report"

todayDate=$(date "+%F")
todaySec=$(date --date=$todayDate "+%s")

lastbackupDir=$(ls $backupParentDir -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r -k2 | head -1)
if [ "$lastbackupDir" != "" ]
then

    lastbackupSec=$(date --date=$(ls $backupParentDir -1 | grep -Eo "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r -k2 | head -1 | sed "s/^Backup-//") "+%s")
    let dateDiff=($todaySec\-$lastbackupSec)/60/60/24
else
    dateDiff=8
fi    
    

if [ "$dateDiff" -le 7 ]
then

    currentbackupDir=$backupParentDir$lastbackupDir"/"

else

    mkdir $backupParentDir$backupPrefix$todayDate
    currentbackupDir=$backupParentDir$backupPrefix$todayDate"/"
    dircreated=1

fi

if [ "$dircreated" == "1" ]
then

    echo "backup created on "$todayDate" in directory "$sourceDir"" >> $backupReport
    echo "Files copied:" >> $backupReport

    for file in $(ls $sourceDir -1)
    do

        cp $sourceDir$file $currentbackupDir$file
        echo $file >> $backupReport

    done

else

    echo "Updating backup in directory "$currentbackDir"." >> $backupReport
    echo "Date: "$todayDate"" >> $backupReport

    for file in $(ls $sourceDir -1)
    do

        currentfile=$currentbackupDir$file

        if [ -f $currentfile ];
        then

            source_size=$(stat $sourceDir$file -c%s)
            actual_size=$(stat $currentfile -c%s)

            if [[ $source_size -ne $actual_size ]];
            then

                mv $currentfile $currentfile"."$todayDate
                cp $sourceDir$file $currentfile
                echo "New version of file "$file" found. Old version moved to "$file.$todayDate"" >> $backupReport

            fi

        else

            cp $sourceDir$file $currentfile
            echo "New file "$file" copied" >> $backupReport

        fi
    done
fi

exit 1