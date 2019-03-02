syntax on

" Color scheme: desert, murphy, molokai, solarized
set t_Co=256
colorscheme desert

"""" Keybindings
" set pastetoggle=<F3>

"""" Behavior
set number          " show line numbers
set wrap            " wrap lines
set mouse=a         " enable mouse support
set visualbell      " blink cursor on error, instead of beeping
set laststatus=2    " always show statusline (even with only single window)
set ruler           " show line and column number of the cursor on right of statusline


"""" Custom spacing
filetype plugin indent off
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType sh setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType html setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType css setlocal expandtab tabstop=4 shiftwidth=4
" show existing tab with 4 spaces width
" when indenting with '>', use 4 spaces width
" On pressing tab, insert 4 spaces
