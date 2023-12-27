#!/bin/bash
rsync -av ~/.config/nvim/lua/* ./nvim/lua 2> /dev/null
rsync -av ~/.config/nvim/after/* ./nvim/after 2> /dev/null
rsync -av ~/.config/nvim/init.lua ./nvim 2> /dev/null
rsync -av ~/.config/nvim/null_ls.sh ./nvim 2> /dev/null
