# Linux_Rice_Xmonad

**All the necessary stuff found [here](https://github.com/VaughnValle/blue-sky/blob/master/README.md) and [here](https://github.com/miscellaneous-mice/Linux_Rice)**

![2](https://github.com/miscellaneous-mice/Xmonad_Rice/assets/79500624/b3002d4d-e907-453c-a7f1-893a5462178e)


## Polybar configuration
- First replace the ```~/.xmonad/xmonad.hs```
```
$ mv ~/.xmonad/xmonad.hs ~/Backup
$ cp ~/Xmonad_Rice/.xmonad/xmonad.hs ~/.xmonad/
```
- Next install and replace the polybar config files. Installation of fonts is given.
```
$ sudo pacman -S polybar
$ cp -r ~/Xmonad_Rice/.config/polybar ~/.config/
$ cp -r ~/.config/polybar/fonts/* ~/.fonts/
```
- Next make all the files executable
```
$ chmod +x ~/.config/polybar/scripts/launcher
$ chmod +x ~/.config/polybar/scripts/powermenu_alt
```
*If you like BSPWM [here you go](https://github.com/miscellaneous-mice/BSPWM_Rice)*
