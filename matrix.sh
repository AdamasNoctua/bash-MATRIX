#!/bin/bash

# Change window title to "MATRIX"
echo -ne '\033]0; MATRIX \007'

# Get amount of columns
col=$(tput cols)

# Amount of symbols per line
len=$(($col/4));

# Set terminal color to green
echo -ne '\033[0;32m';

# Turn off cursor
setterm --cursor off;

# Set the operation delay
timer=0.025;

# Entrance prompt
echo "You've entered the MATRIX. Press Q to exit...";

# Main loop
while true
do
    # Initiate printed line
    line="";
    # Generate line
    for i in $(seq 1 $len)
    do
        # Get random value between 0 and 1
        val=$((( RANDOM % 10)));
        # Increase line
        line=$(printf "${line}%4d\n" "$val");
    done
    # Print line in green
    printf "${line}\n";
    sleep $timer;

    # Check if q is pressed
    read -t $timer -N 1 input
    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
        # The following line is for the prompt to appear on a new line.
        echo ;
        # Turn on the cursor
        setterm --cursor on;
        # Turn terminal color to white
        echo -ne '\033[0;00m';
        # Exit prompt
        echo "You've exited the MATRIX";
        break;
    fi
done
