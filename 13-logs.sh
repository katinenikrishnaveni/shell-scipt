#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logs_folder="/var/log/shellscript-logs"
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

echo "Script excution started at::$Timestamp" &>>$Log_File_Name

if [ $USERID -ne 0 ]
then
   echo "ERROR::you have to acess sudo"
   exit 1
fi

dnf list installed mysql &>>$Log_File_Name

if [ $? -ne 0 ]
then  
   dnf install mysql -y &>>$Log_File_Name
   validate $? "Installing mysql"
else
   echo -e "Already installed.....$Y mysql $N"
fi

dnf list installed git &>>$Log_File_Name

if [ $? -ne 0 ]
then  
    dnf install git -y &>>$Log_File_Name
    validate $? "Installing Git"
else
    echo -e "Alredy installed.......$Y git $N" 
fi       