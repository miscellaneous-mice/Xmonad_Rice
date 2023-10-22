# Rice Xmonad

*{theme} -> catppuccin/nord*

**All the necessary stuff found [here](https://github.com/miscellaneous-mice/Linux_Rice)**

![Xmonad](https://github.com/miscellaneous-mice/Xmonad_Rice/assets/79500624/9ff33d41-0a85-4fe2-b935-44cfa3936ef8)

## Configurations
- Window manager configs
```
$ mv ~/.xmonad/xmonad.hs ~/Backup/
$ cp ~/Xmonad_Rice/{theme}/.xmonad/xmonad.hs ~/.xmonad/
```
- Alacritty themes
```
$ mv ~/.config/alacritty ~/Backup/
$ cp -r ~/Xmonad_Rice/{theme}/.config/alacritty ~/.config/
```
- Rofi configuration
```
$ mv ~/.config/rofi ~/Backup/
$ cp -r /Xmonad_Rice/{theme}/.config/rofi ~/.config/
```
- Polybar configuration
```
$ sudo pacman -S polybar
$ mv ~/.config/polybar ~/Backup/
$ cp -r ~/Xmonad_Rice/{theme}/.config/polybar ~/.config/
$ cp -r ~/.config/polybar/fonts/* ~/.fonts/
$ chmod +x ~/.config/polybar/scripts/launcher
$ chmod +x ~/.config/polybar/scripts/powermenu_alt
```
- [Terminal configurations(zshrc, neovim, alacritty)](https://github.com/miscellaneous-mice/Terminal_Rice)

## Packages
- feh (pacman)
- alsa-utils (pacman)
- alacritty (pacman)
- rofi (pacman)
- picom (pacman)
- polybar (pacman)
- scrot (pacman)
- rofi-calc (pacman)
- shell-color-scripts (yay)
- pipes ([github](https://github.com/pipeseroni/pipes.sh))
- tty-clock ([github](https://github.com/xorg62/tty-clock))
- unimatrix ([github](https://github.com/will8211/unimatrix))


## Common
- Fonts
  - [otf-font-awesome](https://archlinux.org/packages/extra/any/otf-font-awesome/)
  - [ttf-ubuntu-font-family](https://archlinux.org/packages/extra/any/ttf-ubuntu-font-family/)
  - [ttf-fira-mono](https://archlinux.org/packages/extra/any/ttf-fira-mono/)
  - [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)
  - [Iosevka Nerd Font](https://www.nerdfonts.com/font-downloads)
  - [Mononoki nerd fonts](https://www.nerdfonts.com/font-downloads)
  - [SauceCodePro nerd fonts](https://www.nerdfonts.com/font-downloads)
- Icons
   - [oranchelo](https://github.com/OrancheloTeam/oranchelo-icon-theme)

## Catppuccin
- [Polybar](https://github.com/miscellaneous-mice/polybar)
- [Alacritty](https://github.com/miscellaneous-mice/Terminal_Rice/tree/main#configuring-alacritty-themes)
- [Firefox](https://addons.mozilla.org/en-GB/firefox/addon/catppuccin/)
- [Rofi](https://github.com/catppuccin/rofi/tree/main)
- [Wallpaper](https://github.com/Gingeh/wallpapers/tree/main)
- [Theme](https://github.com/catppuccin/gtk)
- [Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme#third-party-packages)
- [Others](https://github.com/catppuccin/catppuccin)

## Nord
- [Polybar](https://github.com/miscellaneous-mice/polybar)
- [Alacritty](https://github.com/miscellaneous-mice/Terminal_Rice#configuring-alacritty-themes)
- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/arctic-nord-theme/?utm_content=addons-manager-reviews-link&utm_medium=firefox-browser&utm_source=firefox-browser)
- [Rofi](https://github.com/catppuccin/rofi/tree/main)
- [Wallpaper](https://github.com/theglitchh/Nord-Wallpapers)
- [Theme](https://www.xfce-look.org/p/1267246/)
- [Icons](https://www.xfce-look.org/p/1937741)
- [Font](https://damieng.com/blog/2008/05/26/envy-code-r-preview-7-coding-font-released/)  
- [Others](https://www.nordtheme.com/docs/colors-and-palettes)

- Credit
  - https://github.com/VaughnValle/blue-sky
