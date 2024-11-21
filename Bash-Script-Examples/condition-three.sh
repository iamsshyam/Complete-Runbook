#!/bin/bash
read -p "Enter a value: " input

if [ -d "$input" ]; then
    echo "$input is a directory. Deleting..."
    rm -r "$input"
elif [ -f "$input" ]; then
    echo "$input is a file."
else
    echo "$input is neither a file nor a directory, or it does not exist."
fi
