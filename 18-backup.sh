#!/bin/bash

G="e[31m"
R="e[32m"
y="\e[33m"
N="\e[0m"

logs_folder="/home/ec2-user/shellscript-log"
log_file=$(echo $0 |awk -F "/" '{print $NF}'| cut -d "." -f1)
Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
Log_File_Name="$logs_folder/$log_file-$Timestamp.log"


source_id=$1
dest_id=$2
days=${3:-14}

usage(){
    echo -e"$R usage:: sh 18-backup.sh <source_id> <dest_id> <days(optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-log

if [ $# -lt 2 ]
then
    usage
fi    

if [ ! -d $source_id ]
then
  echo -e "$source_id source file does not exist..please check it  "
  exit 1
fi

if [ ! -d $dest_id ]
then
   echo -e "$dest_id deoes not exit ...please check it "
   exit 1
fi

echo "Script excution started at::$Timestamp" >>$Log_File_Name

file=$(find $source_id -name "*.log" -mtime +14)

if [ -n "$file" ]
then
   echo "files are exist:$file"
   zipfile=$dest1_id/app-log-$Timestamp.zip
   find $source_id -name "*.log" -mtime +14 | zip -@ $zipfile
   if [ -f "$zipfile" ]
   then
      echo -e "$G zip file succesfully created older than $days"
      while read -r filepath
      do
         echo "deleting:$filepath"
         rm -rf $filepath
         echo ""deleted:$filepath
      done <<< $file
    else 
        echo -e"$R zipfile not created..please check it $N"
        exit 1        
     fi   
else
   echo -e"$R files does not exist $N"   
fi