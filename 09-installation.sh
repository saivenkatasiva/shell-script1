#!/bin/bash

USERID=$(id -u) #here we are checking it is super user or not 
if [ $USERID -ne 0 ] #id -u must be 0 for root access
then
echo "please run with root access"
exit 1 #manually exit if error comes
else 
echo "your super user"
fi
dnf install mysql -y
if [ $? -ne 0]  #$? is to check previous command output is zero means syccess
then
echo "installation of mysql is failed"
exit 1 #manually exit if error comes, 
fi