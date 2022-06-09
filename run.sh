#!/bin/bash

# cheking if "run.sh" script is running

  . ./1_install_nginx.sh 

  . ./2_getting_nginx_conf.sh 

  . ./3_adding_nginx_index.sh 

  . ./4_creating_nginx_webpage.sh &


# checking script execution

if [[ $(echo $?) == 0 ]]
then
  echo "Execution of script 4 is ok"
fi


# restarting nginx

systemctl reload nginx


# cheking run.sh execution

if [[ $(echo $?) == 0 ]]
then
  echo "Execution of run.sh is ok"
fi
