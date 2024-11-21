#!/bin/bash

# Prompt the user for two dates in the format YYYY-MM-DD
read -p "Enter the first date (YYYY-MM-DD): " date1
read -p "Enter the second date (YYYY-MM-DD): " date2

# Convert dates to seconds since epoch for easy calculation
date1_sec=$(date -d "$date1" +%s)
date2_sec=$(date -d "$date2" +%s)

# Check if the date conversion was successful
if [ $? -ne 0 ]; then
    echo "Invalid date format. Please use YYYY-MM-DD."
    exit 1
fi

# Calculate the absolute difference in seconds and convert to days
diff_sec=$((date2_sec - date1_sec))
diff_days=$((diff_sec / 86400))

# Use absolute value to avoid negative results
echo "The difference between the two dates is: ${diff_days#-} days."
