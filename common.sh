#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_id="/home/ec2-user/app-log"
logs_folder="/var/log/shellscript-log"
log_file=$(echo $0 | cut -d "." -f1)
Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
Log_File_Name="$logs_folder/$log_file-$Timestamp.log"

validate()
{
 if [ $1 -ne 0 ]
 then
     echo -e "$2.....$R Failure $N"
     exit 1
 else
     echo -e "$2....$G Success $N"
  fi  
}   