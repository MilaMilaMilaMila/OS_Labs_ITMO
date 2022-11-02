#!/bin/bash

(crontab -l; echo "*/5 * * * 1 sh 1.sh") | crontab -
# */5 - 0 или 5 минута