#!/bin/bash

# installing wget
if [[ ! -f /usr/bin/wget ]]
then  
  apt update
  apt-get install wget -y
fi

# getting "bootcamp_aca.conf"
wget https://transfer.sh/QX7UuX/bootcamp_aca.conf

# mooving "bootcamp_aca.conf" to nginx configuration directory
if [[ -f ./bootcamp_aca.conf ]]
then
  mv ./bootcamp_aca.conf /etc/nginx/sites-available
fi

# making soft link to nginx config file from "sites-available" directory to "sites-enabled" directory
if [[ ! -f /etc/nginx/sites-enabled/bootcamp_aca.conf ]]
then
  ln -s /etc/nginx/sites-available/bootcamp_aca.conf /etc/nginx/sites-enabled/bootcamp_aca.conf
fi

# removing nginx default config file
if [[ -f /etc/nginx/sites-enabled/default ]]
then
  rm /etc/nginx/sites-enabled/default
fi


# checking script execution

if [[ $(echo $?) == 0 ]]
then
  echo "Execution of script 2 is ok"
fi
