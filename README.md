config
======

Raspberry Pi config scripts

This will set your Pi to auto-login and run a script automatically when plugged in, giving it more Arduino-like plug and play functionality.

WARNING: THESE SCRIPTS ASSUME A CLEAN INSTALL OF OCCIDENTALIS V0.2 AND ARE NOT TESTED ON OTHER DISTROS! They are quick and dirty and contain hard-coded paths and other nastiness.

Instructions:

1) Create a new user account for yourself so that in case the pi account gets screwed up somehow, you can still get in (replacing [user] with your new username):

sudo useradd [user]

sudo passwd [user]

sudo adduser [user] sudo

2) Clone this repo into the pi account's home directory (so it resides in /home/pi/config)

3) Navigate to the config directory in a terminal and run the following:
sudo ./config.sh

4) This currently assumes that you have cloned the pulse-test repo into the home directory as well. If this is false, edit startup.sh to change the path to the script you'd like to run on startup.

NOTE: Once the script has auto-launched on startup, you can kill it by running this:
sudo pkill python
(This will actually kill all running python scripts, but for our purposes that's OK at the moment. If you don't want to do that, you can also run ps -ax to get the process number of the script, then sudo kill [process number] )
