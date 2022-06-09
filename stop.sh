#!/bin/bash

# stop command for "run.sh" script

pid=$(pidof -x run.sh)

if [[ $pid -ne 0 ]]
then
  kill -9 $pid
  echo "run.sh script successfully stopped"
elif [[ $(echo $?) -eq 1 ]]
then
  echo "run.sh script is not executing"
fi
