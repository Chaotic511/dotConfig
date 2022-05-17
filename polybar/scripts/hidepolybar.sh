#!/bin/bash

#Get screen size
root_geo=2560x1440
# this automatically gets your screen resolution, doesnt really work with multi monitor  $(xwininfo -root | awk -F'[ +]' '$3 ~ /-geometry/ {print $4}')

#infinite loop
while :
do
 sleep 1
  #Check if any window fills the screen
  win_fills=$(xwininfo -root -tree | grep $root_geo)
  #If any window fills the screen hide polybar, otherwise show it
  if [ -z "$win_fills" ]
    then
      polybar-msg cmd show
  else
      polybar-msg cmd hide
  fi
done
 

