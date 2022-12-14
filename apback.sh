#!/bin/bash

backupParentDir="$HOME/"
restoreDir="$HOME/restore/"
backupPrefix="Backup-"

if [[ ! -d "$restoreDir" ]];
then

    mkdir $restoreDir

fi

latestBackup=$(find $backupParentDir$backupPrefix* -maxdepth 0 | sort -rn | head -n 1)"/"


for file in $(ls $latestBackup -1);
do

    if [ "$(echo $file | grep -Eo "[0-9]{4}-[0-9]{2}-[0-9]{2}")" == "" ];
    then

        cp $latestBackup$file $restoreDir$file

    fi

done
