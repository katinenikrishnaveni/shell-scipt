#!/bin/bash

DISK_USAGE=$(df -hT|grep xfs)
DISK_THESHOLD=5
MSG=""

while read -r line
do
  UASGE=$(echo $line |awk -F " " '{print $6F}'|cut -d "%" -f1)
  PARTITION=$(echo $line|awk -F " " '{print $NF}')
  MSG="High disk usage of partition:$PARTITION usage of:$UASGE"
done <<<$DISK_USAGE

echo "Message"$MSG"