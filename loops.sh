#!/bin/bash

USERId=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER= "/var/log/shell-script"
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

if [ $USERId -ne 0 ]; then
    echo -e " $R ERROR:: Run this script as root user $N "
    exit 1
fi

VALIDATE() {
    if [$1-ne 0]; then
        echo -e "$R Installing $2 is failed $N"
        exit 1
    else
        echo -e "$G Installing $2 is Sucess $N"
    fi
}

for package in $@
 do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
    echo " $G Installing $package $N"
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e " $G $package already installed $N"
    fi
done

