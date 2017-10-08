call plug#begin('~/.local/share/nvim/plugged')
" Plugins will go here in the middle.
call plug#end()

" Make jk to be esc
inoremap jk <ESC>
" Change the leader key
let mapleader = "\<Space>"
"Do not know what this do
filetype plugin indent on
syntax on
set encoding=utf-8

