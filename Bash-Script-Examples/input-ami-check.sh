#!/bin/bash

# Fetch AMI creation date
AMI_DATE=$(aws ec2 describe-images --image-id "$INPUT_AMI" --region "$REGION" --query 'Images[*].CreationDate' --output text)

# Convert AMI creation date to epoch time
AMI_EPOCH=$(date -d "$AMI_DATE" +%s)

# Get current date in epoch time
CURRENT_EPOCH=$(date +%s)

# Calculate the age of the AMI in days
AGE_IN_DAYS=$(( (CURRENT_EPOCH - AMI_EPOCH) / 86400 ))

# Check if AMI is older than 30 days
if [[ $AGE_IN_DAYS -gt 30 ]]; then
    echo "AMI is older than 30 days (Age: $AGE_IN_DAYS days)"
    exit 1
else
    echo "AMI is within 30 days (Age: $AGE_IN_DAYS days)"
fi


# Fetch AMI Name
AMI_NAME=$(aws ec2 describe-images --image-id "$INPUT_AMI" --region "$REGION" --query 'Images[*].Name' --output text)

# Check if "abc" exists in AMI Name
echo "$AMI_NAME" | grep -q "abc"

if [[ $? -eq 0 ]]; then
    echo "AMI name contains 'abc'"
else
    echo "AMI name does NOT contain 'abc'"
    exit 1
fi

# Fetch AMI Public attribute
AMI_PUBLIC=$(aws ec2 describe-images --image-id "$INPUT_AMI" --region "$REGION" --query 'Images[*].Public' --output text)

# Check if AMI is public or private
if [[ "$AMI_PUBLIC" == "True" ]]; then
    echo "AMI $INPUT_AMI is PUBLIC"
else
    echo "AMI $INPUT_AMI is PRIVATE"
fi
