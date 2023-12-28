#!/bin/bash

cp ~/.config/bspwm/bspwmrc ~/00/dotfiles/bspwm/bspwmrc
cp ~/.config/picom/picom.conf ~/00/dotfiles/picom/picom.conf
cp ~/.config/starship.toml ~/00/dotfiles/starship/starship.toml 
cp ~/.config/kitty/kitty.conf ~/00/dotfiles/kitty/kitty.conf
cp ~/.config/sxhkd/sxhkdrc ~/00/dotfiles/sxhkd/sxhkdrc
rsync -av ~/.config/nvim ~/00/dotfiles/nvim

