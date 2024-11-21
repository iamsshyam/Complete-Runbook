#  Write a script that prints numbers from 1 to 100, 
#  but for multiples of 3, print "Fizz," for multiples of 5 print "Buzz," and for multiples of both, print "FizzBuzz."

#!/bin/bash

for i in {1..100}; do
    if [ $((i % 3)) -eq 0 ] && [ $((i % 5)) -eq 0 ]; then
        echo "FizzBuzz"
    elif [ $((i % 3)) -eq 0 ]; then
        echo "Fizz"
    elif [ $((i % 5)) -eq 0 ]; then
        echo "Buzz"
    else
        echo "$i"
    fi
done
