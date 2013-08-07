sudo /home/pi/openpixelcontrol/bin/ws2801_server > /dev/null 2> /dev/null &
sleep 2
cd /home/pi/mens-amplio
sudo ./led_plaything.py > /dev/null 2> /dev/null &
