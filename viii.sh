#!/bin/bash

awk '{ FS=":"; print $3, $1;}' /etc/passwd | sort -n -k 1
# fs - разделитель
# -k 1 - сортируем по первому столбцу