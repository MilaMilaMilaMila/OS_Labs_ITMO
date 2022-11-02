#!/bin/bash

./6_handler.sh  & pid=$!
./6_generator.sh $pid
# chmod +x 6_handler.sh