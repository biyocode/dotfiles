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

cp ~/.local/share/konsole/Main.profile ./konsole/ 2> /dev/null
status_check
echo ": konsole - Main.profile"

cp ~/.local/share/konsole/konsole.css ./konsole/ 2> /dev/null
status_check
echo ": konsole - konsole.css"

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

cp ~/.profile ./manjaro/.profile 2>/dev/null
status_check
echo ": manjaro - .profile"
