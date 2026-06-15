#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
echo " ERROR: RUN AS ROOT USER"
exit 1
fi

dnf install nginx -y
if [ $? -ne 0 ]; then
echo " ERROR: NGINX INSTALLATION FAILED"
exit 1
else
echo " SUCCESS: NGINX INSTALLATION SUCCESSFUL"
fi
