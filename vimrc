syntax on

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Color scheme: desert, murphy, molokai, solarized
set t_Co=256
colorscheme desert

""" Keybindings
" set pastetoggle=<F3>

""" Behavior
set number          " show line numbers
set wrap            " wrap lines
" set mouse=a         " enable mouse support
set novisualbell      " blink cursor on error, instead of beeping
set laststatus=2    " always show statusline (even with only single window)
set ruler           " show line and column number of the cursor on right of statusline
set showmatch       " highlight matching parentheses / brackets
set wildmenu        " visual autocomplete for command menu
set encoding=utf-8  " set encoding to UTF-8
set hlsearch        " highlights searches
set relativenumber  " for checking how many lines to move up or down

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>


""" Custom spacing
filetype plugin indent off
set expandtab       " convert tab to spaces
set tabstop=4       " sets tab to 4 spaces
set shiftwidth=4    " sets number of spaces to tab

autocmd FileType c setlocal tabstop=8

""" Misc
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonBuiltin self
augroup end

""" Plugin Settings
""" indentLines
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|']
