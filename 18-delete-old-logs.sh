#!/bin/bash

SOURCE_DIR=/home/ec2-user/log
userid=$(id -u)
R="\e[31m" #RED
G="\e[32m" #GREEN
N="\e[0m"  #NARMAL
Y="\e[33m" #YELLOW

if [ -d $SOURCE_DIR ]
then
    echo -e " $R $SOURCE_DIR $N exists "
else
    echo " $R $SOURCE_DIR $N not exists "
fi

FILES=$( find $SOURCE_DIR -name "*.log" -mtime +14)