#!/bin/bash
# null-sh external requirements
# python autoformatter
pip install black
pip install --upgrade autopep8

# frontend autoformatter
sudo npm install -g --save-exact prettier

# lua autoformatter
sudo luarocks install --server=https://luarocks.org/dev luaformatter
