# A script that takes a filename as a command-line argument and checks if the file exists and is readable.
#!/bin/bash

# Check if a filename was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Store the filename from the argument
FILENAME=$1

# Check if the file exists and is readable
if [ -e "$FILENAME" ] && [ -r "$FILENAME" ]; then
    echo "The file '$FILENAME' exists and is readable."
elif [ -e "$FILENAME" ]; then
    echo "The file '$FILENAME' exists but is not readable."
else
    echo "The file '$FILENAME' does not exist."
fi
