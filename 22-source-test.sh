#!/bin/bash

source ./common.sh

echo "Script excution started at::$Timestamp" >>$Log_File_Name

if [ $USERID -ne 0 ]
then
   echo "ERROR::you have to acess sudo"
   exit 1
fi


file_to_delete=$(find $source_id -name "*.log" -mtime +14)
echo "file is to be deleted :$file_to_delete"

while read -r file
do
 echo "delete the file:$file"
 rm -rf $file
done <<< $file_to_delete 

