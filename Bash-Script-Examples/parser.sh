#!/bin/bash

# A script to extract email addresses from a file and store them in another file.
# Also checks if a specified environment variable exists. If it doesn’t, sets it to a default value.

# Specify the environment variable name and default value
env_var_name="MY_ENV_VAR"
default_value="default_value_here"

# Check if the environment variable exists and is not empty
if [ -z "$MY_ENV_VAR" ]; then
    export MY_ENV_VAR="$default_value"
    echo "Environment variable '$env_var_name' was not set. Setting it to default value: '$default_value'."
else
    echo "Environment variable '$env_var_name' is already set to: '$MY_ENV_VAR'."
fi

# Read the filename from user input
read -p "Enter the file name: " filename

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File '$filename' does not exist."
    exit 1
fi

# Extract email addresses and store them in another file
output_file="extracted_emails.txt"
grep -E -o "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" "$filename" > "$output_file"

# Notify the user of the result
if [ -s "$output_file" ]; then
    echo "Email addresses extracted and saved to '$output_file'."
else
    echo "No email addresses found in '$filename'."
    rm -f "$output_file"  # Remove the output file if it's empty
fi


grep -E -o "^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" $filename
