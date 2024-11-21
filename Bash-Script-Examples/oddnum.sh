#!/bin/bash

#Logic 1
for i in {1..100};
do
    if [ $((i % 2)) != 0 ]; then
        echo $i
    fi
done

#Logic 2

seq 1 100 | awk '{print $1}' && seq 1 100 | awk '{ if ($1 % 2 != 0) print $1 }'

# Print in this format 1: 1, 2: 3, 3: 5
seq 1 100 | awk 'NR % 2 != 0 {print (NR+1)/2 ": " $1}'

