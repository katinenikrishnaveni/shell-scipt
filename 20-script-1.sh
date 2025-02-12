#!/bin/bash

msg="script1"
GREET="Hi from script-1"
source ./21-script-2.sh
echo " Hello:$msg"
echo " value of:$A"

#sh 21-script-2.sh