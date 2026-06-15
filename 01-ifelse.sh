#!/bin/bash

NUMBER=$1

if [$NUMBER -lt 10];then
    echo "Entered number is less than 10"
elif [$NUMBER -eq 0];then
    echo "Entered number is equal to zero"
else
    echo "Entered number is greather than 10"
fi