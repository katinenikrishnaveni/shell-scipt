#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have to ecute the sudo access"
fi

dnf install mysqld -y
 if [ $? -ne 0 ]
  then 
      echo "Installing Mysql.....failure"
   else
      echo "Installing Mysql.....success"
 fi

 dnf install git -y

 if [ $? -ne 0 ]
  then 
     echo "Installing Git.....Failure"
    else
     echo "Installing git.....Success"
 fi