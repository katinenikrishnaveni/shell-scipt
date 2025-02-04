#!/bin/bash

USERID=$(id -u)

validate(){
    if [ $1 -ne 0 ]
    then
       echo "$2 ...... failure"
       exit 1
    else 
       echo  "$2....... Success"
    fi      
}

if [ $USERID -ne 0 ]
then 
   echo "ERROR::you must have to enter the sudo access"
   exit 1
fi

dnf list installed mysql 
 if [ $? -ne 0 ]
 then
     dnf install mysql -y
     validate $? "Installing MYsql"
 else
    echo " Mysql is already......... installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    validate $? "Installing Git"
else
    echo "Git is already.... installed"
fi                