# Write a script that appends the current date and time to a log file each time it runs.
#!/bin/bash

# Define the log file path
LOG_FILE="/var/log/my_log_file.log" # Update this path if needed

# Append the current date and time to the log file
echo "$(date '+%Y-%m-%d %H:%M:%S') - Script executed" >> "$LOG_FILE"
