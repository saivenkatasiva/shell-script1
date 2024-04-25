#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(DATE +%F-%H-%M-%-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
validate() 
{   #here we are validating the exit status of every installing package
    if [ $1 -ne 0]  #we are checking if first argument that is exit status of previous command is zero or not
    then 
    echo "$2...failure"  #if not second argument is showing as failure
    exit 1
    echo "$2 success"  #if yes means its success
    fi
}
if [ $USERID -ne 0 ]
then  
   echo "please run this script wth root access"
   exit 1 #manually exit error comes

else 
  echo "your super user"
fi
for i in $@ #to get all parameters in variables
do
echo "package to install : $i"
dnf list installed $i &>>$LOGFILE #to get installed package and store in log file
if [$? -eq 0]
then
echo -e "$i already installed..$Y skipping $N"
else 
echo "$i not installed..need to install"
dnf install $i -y &>>&LOGFILE
VALIDATE $? "INSTALLATION OF $i"
fi
done