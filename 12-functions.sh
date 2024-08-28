#!/bin/bash

userid=$(id -u)

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
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi
}

CHECK_ROOT
dnf list installed git

 if [ $? -ne 0 ]
 then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing
    VALIDATE
else
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
 then
    echo "mysql is not installed, going to install it.."
    dnf install mysql -y # here installing
    VALIDATE
else
    echo "mysql is already installed, nothing to do.."
fi
