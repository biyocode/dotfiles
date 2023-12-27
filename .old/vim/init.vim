" Common Commands - PlugInstall, PlugUpdate, PlugClean
call plug#begin("~/.config/nvim/plugged")
  Plug 'ghifarit53/tokyonight-vim' "theme
  Plug 'Yggdroot/indentLine' "showing indents
  Plug 'scrooloose/nerdtree' "folder tree
  Plug 'vim-airline/vim-airline' "statusbar
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "lsp
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "finder
  Plug 'junegunn/fzf.vim' "finder
  Plug 'dbakker/vim-projectroot' "finder extension
  Plug 'preservim/nerdcommenter' "block commenting
  Plug 'mhinz/vim-grepper' "search replace all
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'puremourning/vimspector'
  if has("nvim-0.5")
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
  endif
call plug#end()

"####################
"### Vim Settings ###
"####################
"""colors, reset to use xresources instead
set termguicolors
set t_Co=256
autocmd vimenter * hi Normal guibg=none ctermbg=none
autocmd vimenter * hi EndOfBuffer guibg=none ctermbg=none
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
" check mythemes/airline -> vim-airline/autoload/airline/themes
let g:airline_theme='navarch'
"""mouse
set mouse=nvi " these settings let you copy to clipboard from vim, use y to copy selection
set clipboard=unnamedplus
set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
"""standard
let mapleader = " "
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

"#######################
"### Custom Commands ###
"#######################
"########## Surrounding #########
nnoremap <leader>e{ bcw{}<ESC>P
nnoremap <leader>e[ bcw[]<ESC>P
nnoremap <leader>e< bcw<><ESC>P
nnoremap <leader>e( bcw()<ESC>P
nnoremap <leader>e' bcw''<ESC>P
nnoremap <leader>e" bcw""<ESC>P
nnoremap <leader>e` bcw``<ESC>P

nnoremap <leader>E{ bcW{}<ESC>P
nnoremap <leader>E[ bcW[]<ESC>P
nnoremap <leader>E< bcW<><ESC>P
nnoremap <leader>E( bcW()<ESC>P
nnoremap <leader>E' bcW''<ESC>P
nnoremap <leader>E" bcW""<ESC>P
nnoremap <leader>E` bcW``<ESC>P

"###### Search and replace ######
" Replace word(s) under cursor
nnoremap <leader>r /\<\><left><left><C-r><C-w><CR>:%s///g<Left><Left>
" redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
"######### File Jumping #########
" b is back, n is next, q is close current file from buffer
nnoremap <A-b> :bprevious<CR>
nnoremap <A-n> :bnext<CR>
nnoremap <A-q> :bd<CR>
" clear jump history on new file entry
autocmd VimEnter * :clearjumps

"#########################
"### Language Settings ###
"#########################
"### Python ###
" I dont know why syntax doesnt highlight these
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonBuiltin self
                \   syn keyword pythonBuiltin cls
augroup end
"debugger shortcut: insert breakpoint and save
imap <F9> breakpoint()<ESC>:w<CR>

"### C# ###
autocmd FileType cshtml setlocal filetype=html

"###############
"### Spacing ###
"###############
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
autocmd FileType c setlocal tabstop=8 shiftwidth=8 sts=8
autocmd FileType cs setlocal tabstop=4 shiftwidth=4 sts=4
autocmd FileType cshtml setlocal tabstop=4 shiftwidth=4 sts=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 sts=4
autocmd FileType js setlocal tabstop=2 shiftwidth=2 sts=2

"#####################
"### Nvim Terminal ###
"#####################
" open new split panes to right and below
if has("nvim")
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
endif

"########## Plugin Settings ###########
"######################################
"### cock - CocUninstall, CocConfig ###
"######################################
let g:coc_global_extensions = ['coc-pyright', 'coc-emmet', 'coc-css', 'coc-html', 'coc-vetur', 'coc-pairs']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif
  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>
nmap <silent><leader>gr <Plug>(coc-references)

"###################
"### indentLines ###
"###################
let g:indentLine_enabled = 1
let g:indentLine_char = '│'

"################
"### Nerdtree ###
"################ Toggle help (in tree): ?
" Move up dir 'u' in, set selected to root 'C, close all nodes 'x'
" Fullscreen toggle 'A'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" use alt+hjkl/arrows to move between split/vsplit panels
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

"#########################
"### Custom Automation ###
"#########################
au BufNewFile *.html 0r ~/.config/nvim/html.skel | let IndentStyle = "html"
au BufNewFile *.py 0r ~/.config/nvim/py.skel | let IndentStyle = "python"

"######################
"### Find Functions ###
"######################
""" find file, check FZF_DEFAULT_COMMAND in bashrc for find flags
nnoremap <C-f> :ProjectRootExe Files<CR>
nnoremap <Leader>gf :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-n': '! kitty --detach -e nvim ',
  \ 'ctrl-v': 'vsplit' }
""" find string
nnoremap <silent> <Leader>f yaw:ProjectRootExe Rg<CR>
""" below is the rg default command for find string
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always\
  \ --ignore-file .gitignore
  \ --glob '!*/Migrations/*'
  \ --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" Change this for new languages if find functions cannot find the root
let g:rootmarkers = ['venv', '.git', 'package-lock.json', 'NuGet.config']

" search replace all within project folder
let g:grepper={}
let g:grepper.tools=["rg"]
nnoremap <leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<left><left><left><left><left><left><left><left><left><left><left>

""" C#
let g:OmniSharp_server_use_mono = 0
let g:OmniSharp_server_path = '/home/harukai/.cache/omnisharp-vim/omnisharp-roslyn/run'
let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>di <Plug>VimspectorBalloonEval
