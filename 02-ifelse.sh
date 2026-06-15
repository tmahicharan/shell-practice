#!/bin/bash

echo "Please enter a number:"
read NUMBER
if [ $NUMBER %2 -eq 0 ]; then
    echo "Entered number is even"
else
    echo "Entered number is odd"
fi