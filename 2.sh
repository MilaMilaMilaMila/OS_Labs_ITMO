#!/bin/bash

at now+1minutes -f ./1.sh &

tail -n 0 -f ~/report.txt;