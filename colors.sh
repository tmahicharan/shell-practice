#!/bin/bash
#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then 
        echo -e "\e[31m" ERROR: $2 INSTALLATION FAILED"
        exit 1
    else
        echo -e  "\e[32m" SUCCESS: $2 INSTALLATION SUCCESSFUL"
    fi
}

dnf install nginx -y
VALIDATE $? "NGINX "

dnf install mysql -y
VALIDATE $? "MYSQL"    

dnf install python3 -y
VALIDATE $? "PYTHON3"
