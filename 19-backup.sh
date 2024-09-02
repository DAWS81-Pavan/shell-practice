#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m" #RED
G="\e[32m" #GREEN
N="\e[0m"  #NARMAL
Y="\e[33m" #YELLOW

USAGE (){
    echo -e " Please provide $R 19-backup.sh <source><destination> $N"
    exit 1
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

FILES=$( find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files: $FILES "

if [ ! -z "$FILES " ]
then 
    echo -e "files are $G found $N"
    ZIPFILE="$DEST_DIR/apps-log-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip "$ZIPFILE" -@

    if [ -f $ZIPFILE ]
    then
        echo -e "$G Successfully zippped files older than 14days $N"
        while IFS= read -r files
        do
            echo "Deleting file: $file"

        done <<< $FILES
    else
        echo -e "Zipping the files is $R failed $N"
        exit 1
    fi
else
    echo -e "files are $R not found $N"
fi

# while IFS= read -r files
# do
#     echo " "