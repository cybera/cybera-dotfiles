" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'rhysd/vim-notes-cli'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tpope/vim-eunuch'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
call plug#end()

" Set Up Lightline
if !has('gui_running')
    set t_Co=256
endif

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" use visual bell instead of beeping
set vb

" incremental search
set incsearch
"
" " Allow hidden buffers
set hidden
"
" " syntax highlighting
" set t_Co=256
" " set cursorline
syntax on
colorscheme desert

" " autoindent
set autoindent|set cindent
"
" " 2 space tabs
set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
"
" " show matching brackets
set showmatch
"
" " show line numbers
set nonumber
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
"
" " make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv
"
" " make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" Start NerdTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif







