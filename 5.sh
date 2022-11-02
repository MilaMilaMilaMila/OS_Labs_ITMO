#!/bin/bash

mkfifo pipe
sh 5_handler.sh&sh 5_generator.sh
rm pipe