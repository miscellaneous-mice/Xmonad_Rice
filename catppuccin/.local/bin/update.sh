#!/bin/sh
cupd=$(checkupdates | wc -l)
#exec notify-send "$cupd updates "
dunstify  "$cupd updates available " -u normal -i ~/.config/dunst/change.png -t 1000
