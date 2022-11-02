#!/bin/bash

sh for_4.sh&
first_pid=$!
sh for_4.sh&
sh for_4.sh&
third_pid=$!

echo $first_pid | (sh 4_control.sh&)

kill $third_pid





