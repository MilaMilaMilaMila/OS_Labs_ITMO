#!/bin/bash

for i in $(seq 1 $1); do
        bash  newmem.bash $2 &
        sleep 1s
done        