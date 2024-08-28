#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){

    if [ $userid -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...$R FAILED $N"
        exit 1
    else
        echo "$2 is...$G SUCCESS $N"
    fi
}

CHECK_ROOT
dnf list installed git

 if [ $? -ne 0 ]
 then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing
    VALIDATE $? "installing git"
else
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
 then
    echo "mysql is not installed, going to install it.."
    dnf install mysql -y # here installing
    VALIDATE $? "installing mysql"
else
    echo "mysql is already installed, nothing to do.."
fi
