#!/bin/bash

# set bash as default shell (takes effect on next login)
sed -i -e "s|/home/pi:/bin/sh|/home/pi:/bin/bash|g" /etc/passwd

# swap lines in /etc/inittab to enable auto-login for pi account
old_inittab="1:2345:respawn:/sbin/getty --noclear 38400 tty1"
new_inittab="1:2345:respawn:/bin/login -f pi tty1 </dev/tty1 >/dev/tty1 2>\&1 #1:2345:respawn:\/sbin\/getty --noclear 38400 tty1"
sed -i -e "s|$old_inittab|$new_inittab|g" /etc/inittab

# add startup.sh to .bashrc
if ! grep 'startup.sh' /home/pi/.bashrc > /dev/null ;
then
	{ echo ""; echo "# start LED script on boot"; echo "bash /home/pi/config/startup.sh"; } >> /home/pi/.bashrc
fi
