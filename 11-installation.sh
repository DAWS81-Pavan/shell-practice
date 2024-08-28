#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 0
fi
 dnf list installed git

 if [ $? -ne 0 ]
 then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing
    if [ $? -ne 0 ]
    then
        echo "Git installation is not success...check it"
        exit 1
    else
        echo "Git installation is success"
    fi
else
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
 then
    echo "mysql is not installed, going to install it.."
    dnf install mysql -y # here installing
    if [ $? -ne 0 ]
    then
        echo "mysql installation is not success...check it"
        exit 1
    else
        echo "mysql installation is success"
    fi
else
    else "mysql is already installed, nothing to do.."
fi
