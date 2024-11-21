#!/bin/bash

# Print y,Y,YES = YES 

read var1

if [[ $var1 == "y" || $var1 == "Y" || $var1 == "YES" ]];then
    echo "YES"
elif [[ $var1 == "n" || $var1 == "N" || $var1 == "NO" ]]; then
    echo "NO"
else
    echo "Invalid"
fi