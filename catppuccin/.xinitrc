#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrandr --output Virtual1 --mode 1920x1080
xrdb -merge ~/.Xresources

export EDITOR=nvim

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=xmonad
exec xmonad

