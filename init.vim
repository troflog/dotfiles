

"""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
" Plugins will go here in the middle.

" auto complete plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Python completion integrated in deoplete
Plug 'zchee/deoplete-jedi'
" File explorer
Plug 'scrooloose/nerdtree'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Syntax checker to be used with syntastic for python
Plug 'nvie/vim-flake8'
" Solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" Monokai colorsheme
Plug 'crusoexia/vim-monokai'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


"""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"


"""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""

" Make jk to be esc
inoremap jk <ESC>
" Change the leader key
let mapleader = "\<Space>"
"Do not know what this do
filetype plugin indent on
syntax on
set encoding=utf-8

#Set path to python virtual environments with neovim packages installed
let g:python_host_prog = '/full/path/to/neovim2/bin/python'
let g:python3_host_prog = '/full/path/to/neovim3/bin/python'

