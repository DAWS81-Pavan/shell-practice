#!/bin/bash

number=18

if [ $number -gt 20 ] #gt, lt, eq, -ne, -ge, -le
then
    echo "given number:$number is greter than 20"
else
    echo "given number:$number is less than 20"
fi