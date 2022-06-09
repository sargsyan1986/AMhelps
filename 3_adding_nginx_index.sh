#!/bin/bash

# getting root path for index.html file
dir=$(cat /etc/nginx/sites-available/bootcamp_aca.conf | grep 'bootcamp' | cut -c14-34)

# making "/var/www/bootcamp_aca" directory
if [[ ! -d $dir ]]
then
  mkdir $dir
fi

# creating dummy index.html file and adding some data to it
> $dir/index.html

# checking curl command status
if [[ ! -f /usr/bin/curl ]]
then
  apt install curl -y
fi

# checking nginx status
if  [[ $(curl -s -I http://localhost | grep HTTP | cut -d " " -f 2) -ne 200 ]]
then
  systemctl reload nginx
fi


# checking script execution

if [[ $(echo $?) == 0 ]]
then
  echo "Execution of script 3 is ok"
fi
