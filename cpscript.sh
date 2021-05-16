#!/usr/bin/env bash
# update only necessary changes
source scripts/utils/globals
source scripts/utils/functions
echo -e "${C}Updating all dotfiles on Arch 0:${NC}"

rsync -av ~/.config/nvim/* --exclude plugged/ ./nvim 2> /dev/null
status_check
echo ": nvim/"

cp ~/.config/kitty/kitty.conf ./kitty/ 2> /dev/null
status_check
echo ": kitty - kitty.conf"

cp -r ~/.config/kitty/t/* ./kitty/themes 2> /dev/null
status_check
echo ": kitty - themes"

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

cp ~/.Xresources ./x/Xresources 2>/dev/null
status_check
echo ": x - .Xresources"

cp ~/.fzf/shell/key-bindings.bash ./fzf/key-bindings.bash 2>/dev/null
status_check
echo ": fzf - key-bindings.bash"

cp ~/.fzfignore ./fzf/fzfignore 2>/dev/null
status_check
echo ": fzf - .fzfignore"
