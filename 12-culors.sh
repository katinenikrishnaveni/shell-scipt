#!/bin/bash

USERID=$(id -u)
R="/e[31m"
G="/e[32m"
Y="/e[33m"

validate()
{
 if [$1 -ne 0]
 then
     echo -e"$2.....$R Failure"
     exit 1
 else
     echo -e"$2....$G Success"
  fi  
}      
if [$USERID -ne 0]
then
   echo "ERROR::you have to acess sudo"
   exit 1
fi

dnf list installed mysql
if [$? -ne 0]
then  
   dnf install mysql -y
   validate $? "Installing mysql"
else
   echo -e"Already installed.....$Y mysql"
fi

dnf list installed git

if [$? -ne 0]
then  
    dnf install git -y
    validate $? "Installing Git"
else
    echo -e"Alredy installed.......$Y git" 
fi       