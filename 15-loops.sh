#!/bin/bash

R="\e[31m" #RED
G="\e[32m" #GREEN
N="\e[0m"  #NARMAL

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
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is...$G SUCCESS $N"
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."
        dnf install $package -y # here installing
        VALIDATE $? "installing $package"
    else
        echo "$package is already installed, nothing to do.."
    fi
done
# dnf list installed git

#  if [ $? -ne 0 ]
#  then
#     echo "Git is not installed, going to install it.."
#     dnf install git -y # here installing
#     VALIDATE $? "installing git"
# else
#     echo "Git is already installed, nothing to do.."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
#  then
#     echo "mysql is not installed, going to install it.."
#     dnf install mysql -y # here installing
#     VALIDATE $? "installing mysql"
# else
#     echo "mysql is already installed, nothing to do.."
# fi
