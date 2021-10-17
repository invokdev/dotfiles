#! /bin/bash

#  Wallpaper
  
	feh --bg-scale ~/wallpapers/lion.jpg &

# Compositor

	picom -f &

# Window Manager

exec dwm & 

# Bash script for dwm status bar

dte(){
	dte="$(date +'%a %b %d %H:%M')"
        echo -e "$dte"
}

mem(){
	mem=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
	echo -e ": $mem"
}

cpu(){
	cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
	echo -e ": $cpu"
}

disk(){
	disk=$(df -Ph | grep "/dev/root" | awk {'print $5'})
	echo -e ": $disk"
}

wifi(){
	wifi=$(nmcli dev wifi | grep -E '^[*]' | awk '/*/ {print $3}')
	echo -e ": $wifi" 
}

netup(){
  netup=$(ifconfig eno1 | grep "TX packets" | awk {'print $6 $7'})
  echo -e ": $netup"
}

netdown(){
  netdown=$(ifconfig eno1 | grep "RX packets" | awk {'print $6 $7'})
  echo -e ": $netdown"
}

bat(){
	bat=$(acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi')
	echo -e ": $bat%"
}

temp(){
    temp=$(($(cat /sys/class/thermal/thermal_zone2/temp) / 1000)) 
    echo -e ": $temp°C" 
}

while true; do 
  xsetroot -name " $(mem) | $(disk) | $(cpu) | $(temp) | $(netup) $(netdown) | $(dte) "
	sleep 3s
done 
