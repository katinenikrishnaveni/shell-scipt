#!/bin/bash

USERID=$(id -u)
R="/e[31m"
G="/e[32m"
Y="/e[33m"
validate(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 ......$R failure"
       exit 1
    else 
       echo -e "$2.......$G Success"
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
    echo -e " Mysql is already.........$Y installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    validate $? "Installing Git"
else
    echo -e "Git is already....$Y installed"
fi                