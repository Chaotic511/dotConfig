#!/bin/sh
killall -q opensnap
killall -q plank
sleep 3 
opensnap -c /etc/opensnap -d &
plank &
nitrogen --restore
xrandr --output DP-0 --mode 2560x1440 --rate 120