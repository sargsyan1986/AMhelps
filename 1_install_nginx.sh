#!/bin/bash

# checking and installing nginx and ufw
if [[ ! -f /usr/sbin/nginx ]]
then
  apt update
  apt install -y nginx
  systemctl start nginx
  systemctl enable nginx
elif
  [[ ! -f /usr/sbin/ufw ]]
then
  apt update
  apt install ufw -y
  ufw enable
fi

# adding nginx firewall rules
if [[ "$(ufw status | tr -s " " | cut -d " " -f 3 | grep -i "allow" | sort -u)" == "AllOW" ]]
then	
  ufw allow 'nginx HTTP'
  ufw reload
fi

# checking nginx status
nginx -t


# checking script execution

if [[ $(echo $?) == 0 ]]
then
  echo "Execution of script 1 is ok"
fi
