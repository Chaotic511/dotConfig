#!/bin/sh
killall -q polybar
sleep 1 
polybar MyBar &
xinput --set-prop "Glorious Model D Wireless" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 2