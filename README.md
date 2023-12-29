# Dotfiles

This is a work in progress, check back for updates. Might look into making a changelog.
Each folder should have a README of some tips.

## Current Machine: Arch
 - Shell: bash
   - Prompt: Starship
 - WM: bspwm
 - Terminal: kitty
    - Font: Fira Code
 - Editor: neovim
 - Status Bar: polybar
 - Compositor: picom
 - Menu: rofi
 - Theme Stuff: gtk-3.0
    - Theme: Juno Ocean
    - Icons: Infinity Lavender Dark Icons
 - File Explorer: thunar-git
 - Search: fzf, fd, ripgrep
 - Misc: exa, bat
 - Lockscreen: betterlockscreen
 - Password Manager: pass

## Wallpapers
  - Justin Maller (Modified by me)

## Commands
Wifi:
  - `nmtui`
Bluetooth:
  - `bluetoothctl`
    - `scan on`: scans for new devices
    - `scan off`: turn off scan, do this after you don't need to scan anymore
    - `list`: lists devices
    - `connect <mac address>`: connect to your device
    - `help`: more commands
Audio:
  - `alsamixer`: terminal control of volume

## Some settings
- Icons
  - `~/.config/gtk-3.0/settings.ini`
  - `/usr/share/icons/*`

## TODO
- Multiple Monitor setup
- better bluetooth management
- Wifi script?
- Test mic
- Auto detect usb mounts
