#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script execution started at: $(date)"

if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then 
        echo -e "$R ERROR: $2 INSTALLATION FAILED $N"
        exit 1
    else
        echo -e  "$G SUCCESS: $2 INSTALLATION SUCCESSFUL $N"
    fi
}


dnf list installed nginx &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    echo -e "$Y NGINX NOT INSTALLED, INSTALLING NGINX $N"
    dnf install nginx -y
    VALIDATE $? "NGINX "
else
    echo -e "$G NGINX ALREADY INSTALLED $N"
fi

dnf list installed mysql &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    echo -e "$Y MYSQL NOT INSTALLED, INSTALLING MYSQL $N"
    dnf install mysql -y
    VALIDATE $? "MYSQL"    
else
    echo -e "$G MYSQL ALREADY INSTALLED $N"
fi

dnf list installed python3 &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    echo -e "$Y Python3 NOT INSTALLED, INSTALLING PYTHON3 $N"
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else
    echo -e "$G Python3 ALREADY INSTALLED $N"
fi
