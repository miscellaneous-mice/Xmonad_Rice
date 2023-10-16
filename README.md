# Linux_Rice_Xmonad

**All the necessary stuff found [here](https://github.com/VaughnValle/blue-sky/blob/master/README.md) and [here](https://github.com/miscellaneous-mice/Linux_Rice)**

![Rice_3](https://github.com/miscellaneous-mice/Xmonad_Rice/assets/79500624/b1e5527c-762c-40b9-ab24-4a793d840588)

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
