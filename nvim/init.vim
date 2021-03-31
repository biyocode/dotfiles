"""plugins
" Common Commands - PlugInstall, PlugUpdate, PlugClean
call plug#begin("~/.config/nvim/plugged")
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdtree'
  Plug 'Raimondi/delimitMate'
  Plug 'vim-airline/vim-airline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"""colors
set termguicolors
set t_Co=256
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"""mouse
" these settings let you copy to clipboard from vim, use y to copy selection
set mouse=nvi
set clipboard=unnamedplus
set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
"""standard
syntax on
set encoding=utf-8
set novisualbell
set wrap
set number
set laststatus=2
syntax enable
set hlsearch
set cursorline
set number
set relativenumber
set wildmenu
set ruler  
""coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"""language settings
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonBuiltin self
                \   syn keyword pythonBuiltin cls
augroup end
"""spacing
filetype plugin indent off
set expandtab
set tabstop=2
set shiftwidth=2
autocmd FileType c setlocal tabstop=8 shiftwidth=8
autocmd FileType python setlocal tabstop=4 shiftwidth=4 sts=4
"""integrated terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 8
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

""" Plugin Settings
"" cock - CocUninstall, CocConfig
" python https://github.com/neoclide/coc-python
let g:coc_global_extensions = ['coc-pyright', 'coc-emmet', 'coc-css', 'coc-html']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
"" indentLines
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
"" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" delimitMate to turn off autocomplete on specific words:
" au FileType mail let b:delimitMate_autoclose = 0 : this turns off for 'mail'
""" Custom
au BufNewFile *.html 0r ~/.config/nvim/html.skel | let IndentStyle = "html"
