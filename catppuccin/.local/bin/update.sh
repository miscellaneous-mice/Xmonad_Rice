#!/bin/sh
cupd=$(checkupdates | wc -l)
#exec notify-send "$cupd updates "
dunstify  "$cupd updates available " -u normal -i ~/Downloads/change.png -t 1000
