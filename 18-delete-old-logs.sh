#!/bin/bash

SOURCE_DIR=/home/ec2-user/log
R="\e[31m" #RED
G="\e[32m" #GREEN
N="\e[0m"  #NARMAL
Y="\e[33m" #YELLOW


if [ -d $SOURCE_DIR ]
then 
    echo -e "$SOURCE_DIR is $G exists $N"
else
    echo -e "$SOURCE_DIR is not $R exists $N"
fi

FILE=$( find $SOURCE_DIR -name "*.log" -mtime +14 )

echo "files: $FILE"

while IFS= read -r file
do
    echo "delting file: $file"
    rm -rf $file
done <<< $FILE






# if [ -d $SOURCE_DIR ]
# then
#     echo -e "  $SOURCE_DIR is $G exists $N"
# else
#     echo " $SOURCE_DIR is not $R exists $N"
# fi

# FILE=$( find $SOURCE_DIR -name "*.log" -mtime +14)
# echo files is $FILE

# while IFS= read -r file
# do
#     echo "Deleting file: $file"
#     rm -rf $file
# done <<< $FILE

# # if [ -d $SOURCE_DIR ]
# # then
# #     echo -e " $R $SOURCE_DIR $N exists "
# # else
# #     echo " $R $SOURCE_DIR $N not exists "
# # fi

# # FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
# # echo "files: $FILES"