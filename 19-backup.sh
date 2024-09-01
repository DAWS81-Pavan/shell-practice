#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2


R="\e[31m" #RED
G="\e[32m" #GREEN
N="\e[0m"  #NARMAL
Y="\e[33m" #YELLOW

USAGE (){
    echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ -d $OURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist...Please check"
else
    echo "$SOURCE_DIR is exists"
fi