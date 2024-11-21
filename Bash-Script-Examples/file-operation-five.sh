# Check if it ia readable file or not

#!/bin/bash
if [ -r "$1" ]; then
  echo "File $1 exists and is readable."
else
  echo "File $1 either doesn't exist or is not readable."
fi
