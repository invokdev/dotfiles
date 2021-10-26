#! /bin/bash

#  Wallpaper
  
	feh --bg-scale ~/wallpapers/lion.jpg &

# Compositor

	picom -f &

# Path to bash script for dwm bar

  /home/$USER/dwm_bar/dwm_bar.sh & 

# Set brightness

  xbacklight -set 75 &

# Window Manager

  exec dwm  

