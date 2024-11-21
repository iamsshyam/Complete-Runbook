#!/bin/bash
n=$1
for ((i=2; i*i<=n; i++)); do
  if (( n % i == 0 )); then
    echo "$n is not prime."
    exit
  fi
done
echo "$n is prime."
