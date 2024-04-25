#!/bin/bash
#to over comes the duplicate code we are introducing functions here

USERID=$(id -u) #here we are checking it is super user or not 
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
echo "script strted executing at : $TIMESTAMP"
validate() 
{   #here we are validating the exit status of every installing package
    if [ $1 -ne 0]  #we are checking if first argument that is exit status of previous command is zero or not
    then 
    echo -e "$2...$R failure $N"  #if not second argument is showing as failure
    exit 1
    echo -e "$2 $G success $N"  #if yes means its success
}
if [ $USERID -ne 0 ] #id -u must be 0 for root access
then
echo "please run with root access"
exit 1 #manually exit if error comes
else 
echo "your super user"
fi
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "installing mysql"

dnf install git -y
VALIDATE $? "installing git" &>>$LOGFILE