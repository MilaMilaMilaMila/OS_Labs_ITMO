#!/bin/bash

d=$(date '+%d.%m.%y_%H:%M:%S')

mkdir ~/test && echo "catalog test was created successfully" >> ~/report.txt ; touch ~/test/$d.txt

ping -c 1 www.net_nikogo.ru || echo "$d host is unavailable" >> ~/report.txt;