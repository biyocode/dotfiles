#!/bin/bash
rsync -av ~/.config/nvim/lua/* ./nvim/lua 2> /dev/null
rsync -av ~/.config/nvim/after/* ./nvim/after 2> /dev/null
rsync -v ~/.config/nvim/init.lua ./nvim 2> /dev/null
rsync -v ~/.config/nvim/null_sh.sh ./nvim 2> /dev/null
