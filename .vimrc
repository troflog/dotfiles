"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
"
"                        MY VIM VIMRC FILE                             
"
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"================================================= 
"               Plugins
"================================================= 



" Plugins will go here in the middle.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'c.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


filetype plugin on

"================================================
" Basic Settings
"================================================


"highlight all search pattern matches
set hlsearch

" turn filetype detection, indent scripts and filetype plugins on
filetype plugin indent on
set encoding=utf-8
" copy indent from current line when starting a new line
set autoindent
"automatically inserts one extra level of indentation
"in some cases, and works for C-like files
set smartindent
" syntax highlighting
syntax enable
" Copies using system clipboard
set clipboard+=unnamedplus
" display line number relatively to the current one
set rnu
" highlight the current line and column
"set cursorline
"set cursorcolumn
" <tab> inserts spaces instead of tabs
set expandtab
" size of <tab> measured in spaces
set tabstop=4
" size of an indent, 4 spaces to match <tab>
set shiftwidth=4
" enable mouse
set mouse=a
" disable text wrapping
set textwidth=0


"============================
" Basic Mappings
"============================

" make jk to be esc
inoremap jk <ESC>
" splits behaviour
set splitbelow
set splitright
" map leader
"let mapleader = ","

"
" set moving between windows to ctrl+hjkl
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-j> <C-w>j


" make it easy to leave terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"============================
" Auto commands
"============================
" remove blank characters at the end of every line when saving file,
" need to be disabled for some filetypes like markdown or latex
" where trailing spaces are important
autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e



"Set cursor type mode depenend
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

