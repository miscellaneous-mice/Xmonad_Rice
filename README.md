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
  $ chmod +x ~/.config/polybar/launch.sh
  ```
- [Terminal configurations(zshrc, neovim, alacritty)](https://github.com/miscellaneous-mice/Terminal_Rice)
  - Extra step
  ```
  $ cp ~/Xmonad_Rice/{theme}/.zprofile ~/
  ```
  - comment these lines in ```~/.zshrc```
  ```
  #if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  #  exec startx
  #fi
  ```
- Configuring lightdm
  ```
  $ sudo pacman -S lightdm lightdm-gtk-greeter
  $ sudo systemctl enable lightdm
  $ sudo cp ~/Xmonad_Rice/{theme}/wallpaper/lightdm/* /usr/share/backgrounds/
  ```
  - Uncomment these lines in ```sudo nvim /etc/lightdm/lightdm.conf```
  ```
  [LightDM]
  logind-check-graphical=true

  [Seat:*]
  greeter-session=lightdm-gtk-greeter
  display-setup-script=xrandr --output Virtual1 --mode 1920x1080
  ``` 
  - Uncomment these lines in ```sudo nvim /etc/lightdm/lightdm-gtk-greeter.conf```
  ```
  [greeter]
  background=/usr/share/backgrounds/{shaded_landscape/2}.png
  theme-name={Catppuccin-Mocha-Standard-Lavender-Dark/Nordic-darker}
  icon-theme-name={Papirus/Zafiro-Nord-Black-Blue}
  cursor-theme-name=Bibata-Modern-Ice
  font-name=JetBrainsMono Nerd Font
  ```
  - Comment everything in ```~/.zprofile```
  ```
  # Autostart X after TTY login.
  # if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  #   exec startx
  # fi
  ```
  - Specify your resolution ```sudo nvim /etc/default/grub```
  ```
  GRUB_GFXMODE=1920x1080 
  ```
  then run as root,
  ```
  grub-mkconfig -o /boot/grub/grub.cfg
  ```
  - To test use
  ```
  $ lightdm --test-mode --debug
  ```
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
- [Rofi](https://github.com/undiabler/nord-rofi-theme)
- [Wallpaper](https://github.com/theglitchh/Nord-Wallpapers)
- [Theme](https://www.xfce-look.org/p/1267246/)
- [Icons](https://www.xfce-look.org/p/1937741)
- [Font](https://damieng.com/blog/2008/05/26/envy-code-r-preview-7-coding-font-released/)  
- [Others](https://www.nordtheme.com/ports)

Credit
- https://github.com/VaughnValle/blue-sky
