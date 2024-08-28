#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi