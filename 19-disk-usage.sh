#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THESHOLD=5
MSG=""

while read -r line
do
  USAGE=$(echo $line |awk -F " " '{print $6F}'|cut -d "%" -f1)
  PARTITION=$(echo $line|awk -F " " '{print $NF}')
  if [ $USAGE -gt $DISK_THESHOLD ]
  then
     MSG=" High disk usage of partition: $PARTITION usage is: $UASGE "
  fi
done <<< $DISK_USAGE

echo  -e " Message:$MSG "