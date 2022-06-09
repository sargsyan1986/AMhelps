#!/bin/bash

# installing if needed system monitoring programs

if [[ ! -f /usr/bin/vmstat ]]
then
  apt install vmstat
fi

# get 'cpu usage percentage, memory usage, disk usage for "/" directory' and pass it to html file

while true
do

Cpu_usage=$[100-$(vmstat | tail -1 | awk '{print $15}')]

Memory_usage=$(free -h | grep Mem | awk '{print $3}')

Disk_usage=$(df -h / |tail -1 | awk '{print $5}')

Date=$(date +%D--%T)

echo $Date" Cpu-usage="$Cpu_usage"% Memory-usage="$Memory_usage "Disk-usage="$Disk_usage > /var/www/bootcamp_aca/index.html 

sleep 10

done
