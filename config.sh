#!/bin/bash

old_inittab="1:2345:respawn:/sbin/getty --noclear 38400 tty1"
new_inittab="1:2345:respawn:/bin/login -f pi tty1 </dev/tty1 >/dev/tty1 2>\&1 #1:2345:respawn:\/sbin\/getty --noclear 38400 tty1"

sed -i -e "s|$old_inittab|$new_inittab|g" /etc/inittab

if ! grep 'startup.sh' /home/pi/.bashrc > /dev/null ;
then
	{ echo ""; echo "# start LED script on boot"; echo "bash /home/pi/config/startup.sh"; } >> /home/pi/.bashrc
fi
