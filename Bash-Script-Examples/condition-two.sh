#!/bin/bash

read X
read Y
read Z

#Logic 1

if (( X == Y && Y == Z )); then
    echo "It is a EQUILATERAL" 
elif (( X == Y || Y == Z )); then 
    echo "It is a ISOSCELES" 
else 
    echo "It is a SCALENE" 
fi

#Logic 2
if [[ "$X" -eq "$Y" && "$Y" -eq "$Z" ]]; then
    echo "It is a EQUILATERAL"
elif [[ ( "$X" -eq "$Y" && "$Y" -ne "$Z" )  || ( "$X" -eq "$Z" && "$X" -ne "$Y" ) || ( "$Y" -eq "$Z" && "$Y" -ne "$X" )  ]]; then
    echo "It is a ISOSCELES"
else
    echo "It is a SCALENE"
fi






















