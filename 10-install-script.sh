#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have to ecute the sudo access"
   exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
   dnf install mysql -y
   if [ $? -ne 0 ]
   then 
      echo "Installing Mysql.....failure"
      exit 1
   else
      echo "Installing Mysql.....success"
   fi
else
    echo "Mysql is already Installed"
fi

dnf list installed git
if [$? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
     echo "Installing Git.....Failure"
     exit 1
    else
     echo "Installing git.....Success"
    fi
else
    echo "Git is alredy installed"
fi        