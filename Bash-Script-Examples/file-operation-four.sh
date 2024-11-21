#!/bin/bash

# Print header
echo -e "Username\tHome Directory\t\tShell"

# Extract and display username, home directory, and shell for each user
cut -d: -f1,6,7 /etc/passwd | tr ':' '\t'
