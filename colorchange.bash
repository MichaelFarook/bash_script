#!/bin/bash
#
# Changing colorsheme in vim depengin of the time of the day 
#


# Assign the filename
filename=".vimrc"
# Create variable to check the Time 
TIME=$(date "+%H")
HOUR=16
# Creating variables to change colorsheme in vim 
morning="darkblue"
evening="pablo"

# Here I check the time 
if [ $TIME -lt $HOUR ]; then
        cd ~
        sed -i "s/$evening/$morning/" $filename
else    
        cd ~ 
        sed -i "s/$morning/$evening/" $filename
fi

