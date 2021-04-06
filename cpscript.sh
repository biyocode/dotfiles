#!/usr/bin/env bash
# update only necessary changes
source scripts/globals
source scripts/functions
echo -e "${C}Updating all dotfiles on Arch 0:${NC}"

cp ~/.config/nvim/init.vim ./nvim/ 2> /dev/null
status_check
echo ": nvim - init.vim"

cp ~/.config/kitty/kitty.conf ./kitty/ 2> /dev/null
status_check
echo ": kitty - kitty.conf"

cp ~/.config/rofi/config.rasi ./rofi/ 2> /dev/null
status_check
echo ": rofi - config.rasi"

cp ~/.config/polybar/config ./polybar/ 2> /dev/null
status_check
echo ": polybar - config"

cp ~/.config/sxhkd/sxhkdrc ./sxhkd/ 2>/dev/null
status_check
echo ": sxhkd - sxhkdrc"

cp ~/.config/bspwm/bspwmrc ./bspwm/ 2>/dev/null
status_check
echo ": bspwm - bspwmrc"

cp ~/.config/picom.conf ./picom/ 2>/dev/null
status_check
echo ": picom - picom.conf"

cp ~/.config/starship.toml ./starship/ 2>/dev/null
status_check
echo ": starship - starship.toml"

cp ~/.bashrc ./bashrc/bashrc 2>/dev/null
status_check
echo ": bash - .bashrc"

sudo cp ~/etc/acpi/handler.sh ./acpi/handler.sh 2>/dev/null
status_check
echo ": acpi - handler.sh"
