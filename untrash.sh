#!/bin/bash

if [ $# -ne 1 ]; then

echo "Invalid input data. $# arguments get. Expected 1."
exit 1

fi

restFile=/home/user/lab4/$1

flag=0

for i in $(grep -h $1 $HOME/trash.log)
do

    glPath=$(echo $i | awk -F ":" '{print $1}') # полный исходный путь удаленного файла
    trFile=$(echo $i | awk -F ":" '{print $2}') # часть новой жесткой ссылки

    if [[ $restFile == $glPath ]] # проверили совпадение названия полного пути
    then
        flag=1

        rmFile=$HOME/.trash/$trFile # полная жесткая ссылка удаленного файла

        if [ -e $rmFile ]; # проверили, что это реально файл и он сущестует по жесткой ссылке
        then
            echo "$glPath is file wich you want to restore?"
            echo "Restore $glPath: enter YES"
            echo "Skip $glPath: enter any key"
            read answer

            if [[ $answer == "YES" ]]
            then

                if [ -d $(dirname $glPath) ] # проверили, что родительская директория удаленного файла существует и является каталогом
                then

                    if [[ -e $glPath ]] # проверили, что файл с такой же ссылкой существует
                    then

                        echo "File with this name already exist. Enter a new file name."
                        read newName
                        ln "$rmFile" "$(dirname $glPath)/$newName"

                    else # иначе просто создали исходную ссылку

                        ln $rmFile $glPath

                    fi

                else # если каталога уже нет - восстанавливаем в домашнюю директорюю

                    echo "$(dirname $glPath) has been restored in home directory"
                    ln $rmFile $HOME/$1

                fi

                rm $rmFile # удалили жесткую ссылку, созданную при удалении файла
                grep -v $trFile $HOME/trash.log > $HOME/trash0.log # переписываем все строки, кроме текущей в новый файл-костыль
                mv $HOME/trash0.log $HOME/trash.log # помещаем корректный файл-костыль в файл-оригинал

            fi

        fi

    fi

done

if [ $flag -ne 1 ]; then

echo "File wasn't found in trash list."
exit 1

fi