# a shell script to print the current date, time, username, and hostname.

#!/bin/bash

# Print the current date
echo "Current Date: $(date +'%Y-%m-%d')"

# Print the current time
echo "Current Time: $(date +'%H:%M:%S')"

# Print the current hostname
echo "Current Hostname: $(hostname)"

# Print the current username
echo "Current Username: $(whoami)"

data=$(date +"%F")
echo "--------------$data"

#!/bin/bash


# Print the current date in the desired format
echo "Current Date: $(date '+%a, %b %d, %Y')"

# Print the current time
echo "Current Time: $(date +'%H:%M:%S')"

# Print the current hostname
echo "Current Hostname: $(hostname)"

# Print the current username
echo "Current Username: $(whoami)"
