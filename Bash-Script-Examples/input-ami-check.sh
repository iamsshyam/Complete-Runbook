#!/bin/bash

# Fetch AMI Name
AMI_NAME=$(aws ec2 describe-images --image-id "$INPUT_AMI" --region "$REGION" --query 'Images[*].Name' --output text)

# Trim spaces (important for matching)
AMI_NAME=$(echo "$AMI_NAME" | tr -d '[:space:]')

# Debugging: Print the AMI name
echo "Fetched AMI Name: '$AMI_NAME'"

if [[ "$AMI_NAME" == *"amnz"* || "$AMI_NAME" == *"al2023"* || "$AMI_NAME" == *"RHEL"* ]]; then
    echo "It is a public AMI"
    exit 0

elif [[ "$AMI_NAME" == *"Abc"* ]]; then
    echo "Checking AMI age and visibility..."

    # Fetch AMI creation date
    AMI_DATE=$(aws ec2 describe-images --image-id "$INPUT_AMI" --region "$REGION" --query 'Images[*].CreationDate' --output text)

    # Trim spaces
    AMI_DATE=$(echo "$AMI_DATE" | tr -d '[:space:]')

    # Debugging: Print the AMI date
    echo "AMI Creation Date: '$AMI_DATE'"

    # Convert AMI creation date to epoch time
    AMI_EPOCH=$(date -d "$AMI_DATE" +%s)

    # Get current date in epoch time
    CURRENT_EPOCH=$(date +%s)

    # Calculate the age of the AMI in days
    AGE_IN_DAYS=$(( (CURRENT_EPOCH - AMI_EPOCH) / 86400 ))

    # Check if AMI is older than 30 days
    if [[ $AGE_IN_DAYS -gt 30 ]]; then
        echo "AMI is older than 30 days (Age: $AGE_IN_DAYS days)"
    else
        echo "AMI is within 30 days (Age: $AGE_IN_DAYS days)"
    fi

    # Fetch AMI Public attribute
    AMI_PUBLIC=$(aws ec2 describe-images --image-id "$INPUT_AMI" --region "$REGION" --query 'Images[*].Public' --output text)

    # Trim spaces
    AMI_PUBLIC=$(echo "$AMI_PUBLIC" | tr -d '[:space:]')

    # Debugging: Print AMI visibility
    echo "AMI Public Attribute: '$AMI_PUBLIC'"

    # Check if AMI is public or private
    if [[ "$AMI_PUBLIC" == "True" ]]; then
        echo "AMI $INPUT_AMI is PUBLIC"
    else
        echo "AMI $INPUT_AMI is PRIVATE"
    fi

else
    echo "Invalid AMI: '$AMI_NAME' does not match any conditions."
    exit 1
fi
