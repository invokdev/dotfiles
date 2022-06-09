#! /bin/bash

#  Wallpaper
  
	feh --bg-fill ~/wallpapers/w13-bg.png --bg-fill ~/wallpapers/w13-bg.png &

# Compositor

	picom -f &

# Path to bash script for dwm bar

  /home/$USER/dwm_bar/dwm_bar.sh & 

# Start Pipewire

  /usr/bin/gentoo-pipewire-launcher &

# Window Manager

  exec dwm  

