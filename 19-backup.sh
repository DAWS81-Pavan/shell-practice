#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

R="\e[31m" #RED
G="\e[32m" #GREEN
N="\e[0m"  #NARMAL
Y="\e[33m" #YELLOW

USAGE (){
    echo " Please provide 19-backup.sh <source><destination>"
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e " $SOURCE_DIR not $R exits $N"
else
    echo -e " $SOURCE_DIR $G exits $N"
fi

if [ ! -d $DEST_DIR ]
then
    echo -e " $DEST_DIR not $R exits $N"
else
    echo -e " $SOURCE_DIR $G exits $N"
fi
