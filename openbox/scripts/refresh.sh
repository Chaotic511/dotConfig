#!/bin/sh
killall -q opensnap
sleep 3 
opensnap -c /etc/opensnap -d &
~/.fehbg 