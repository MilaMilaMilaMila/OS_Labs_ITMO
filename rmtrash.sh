#!/bin/bash

scriptName=$1

homeTrash=$HOME/.trash

homeLog=$HOME/trash.log

if [ $# -ne 1 ]; then

echo "Invalid input data. $# arguments get. Expected 1."
exit 1

fi

if [ ! -e $1 ]; then

echo "Invalid input data. $1 isn't a file."
exit 1

fi

if [ ! -f $1 ]; then

echo "Invalid input data. $1 doesn't exisit in current directory."
exit 1

fi

if [ -d $homeTrash ]; then :

else

mkdir $homeTrash

fi

currentTrashFile=$(date +%s)
# currentTrashFile=$"remove_date:"$(date)

ln $scriptName "$homeTrash/$currentTrashFile"

rm $scriptName

if [ -e $homeLog ];

then :

else

touch $homeLog

fi

echo "$PWD/$scriptName:$currentTrashFile" >> $homeLog