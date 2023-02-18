#!/bin/bash
# null-sh external requirements
# python autoformatter
pip install black
pip install --upgrade autopep8

# frontend autoformatter
sudo npm install -g prettier_d_slim

# lua autoformatter
sudo luarocks install --server=https://luarocks.org/dev luaformatter

# Linters
sudo npm install -g eslint
sudo npm install -g typescript typescript-language-server

