#!/usr/bin/env bash
source scripts/globals
source scripts/functions
# Manjaro Architect 0
echo -e "${C}Updating all dotfiles on Manjaro Architect 0:${NC}"

cp ~/.config/nvim/init.vim ./nvim/ 2> /dev/null
status_check
echo ": nvim - init.vim"

cp ~/.config/nvim/coc-settings.json ./nvim/ 2> /dev/null
status_check
echo ": nvim - coc-settings.json"

cp ~/.config/.compton.conf ./compton/ 2> /dev/null
status_check
echo ": compton - .compton.conf"

cp ~/.config/konsolerc ./konsole/ 2> /dev/null
status_check
echo ": konsole - konsolerc"

cp ~/.local/share/konsole/Main.profile ./konsole/ 2> /dev/null
status_check
echo ": konsole - Main.profile"

cp ~/.local/share/konsole/konsole.css ./konsole/ 2> /dev/null
status_check
echo ": konsole - konsole.css"

cp ~/.config/kitty/kitty.conf ./kitty/ 2> /dev/null
status_check
echo ": kitty - kitty.conf"

cp ~/.i3/config ./i3/ 2> /dev/null
status_check
echo ": i3 - config"

cp ~/.config/rofi/config.rasi ./rofi/ 2> /dev/null
status_check
echo ": rofi - config.rasi"

cp ~/.config/polybar/config ./polybar/ 2> /dev/null
status_check
echo ": polybar - config"

cp ~/.bashrc ./bashrc/manjaro.bashrc 2>/dev/null
status_check
echo ": bashrc - .bashrc"

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
