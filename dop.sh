#!/bin/bash


ps -axo pid,rss | awk '{if (NR > 1 && $2 > 4) {print $1}}'