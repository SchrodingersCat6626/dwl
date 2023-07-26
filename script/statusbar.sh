#!/usr/bin/sh



    memory () {

        free --mega --total | grep 'Mem' | awk '{var="Memory usage: "$3"" "/" $2 " MiB"; printf var }'
    }

    is_charging () {

        bat_num=$1 

        awk '{if (/Charging/) {print "*"} else {}}' /sys/class/power_supply/BAT$bat_num/status
    }

    battery () {

        echo "Battery 1: $(is_charging 0)$(cat /sys/class/power_supply/BAT0/capacity)% Battery 2: $(is_charging 1)$(cat /sys/class/power_supply/BAT1/capacity)% | $(date '+%a %d %b %Y %I:%M %P %Z')"

    }

    status () {

        echo " $(memory) | $(battery) "

    }

    swaybg -i '/home/thomas/src/kali-wallpapers/2022/backgrounds/kali/kali-glitchsea-16x9.jpg'  &
    
    dwlb -font 'monospace:size=13' -active-bg-color "#646C74" && 

    
    while true; do
        dwlb -status all "$(status)"
        sleep 5
    done
