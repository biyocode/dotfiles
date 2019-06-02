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
set novisualbell    " no blink no sound
set laststatus=2    " always show statusline (even with only single window)
set ruler           " show line and column number of the cursor on right of statusline
set showmatch       " highlight matching parentheses / brackets
set wildmenu        " visual autocomplete for command menu
set encoding=utf-8  " set encoding to UTF-8


"""" Custom spacing
filetype plugin indent off
set expandtab       " convert tab to spaces
set tabstop=4       " sets tab to 4 spaces
set shiftwidth=4    " sets number of spaces to tab

autocmd FileType c setlocal tabstop=8

""" Konsole
"augroup python
"    autocmd!
"    autocmd FileType python
"                \   syn keyword pythonBuilt self
"augroup end
