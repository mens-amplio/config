#!/bin/bash

# full path to the script to be run whenever the pi user logs in
path=/home/pi/pulse-test/pulse.py

grep_string=$(python -c "import os.path; p='$path'; print '['+p[0]+']'+p[1:]")

if ! ps aux | grep $grep_string > /dev/null ;
then
	sudo python $path &
fi
 
