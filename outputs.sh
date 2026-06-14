#!/bin/bash

echo " Today date is $(date + %s)"

start=$(date +%s)
sleep 5
end=$(date +%s)
total=$(( end - start ))
echo " Total time taken is $total seconds"

echo " The current working directory is $pwd"
echo "script name is $0"
echo " who is running this : $USER"
echo " The home directory is $HOME"
echo PID is $$
