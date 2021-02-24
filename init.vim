""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                "
"                                                "
"         MY NEOVIM VIMRC FILE                   "
"                                                "
"                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""

"================================================= 
""               Plugins
"================================================= 

" Plugins will go here in the middle.
call plug#begin('~/.local/share/nvim/plugged')
" Auto complete plugins
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python completion integrated in deoplete
Plug 'zchee/deoplete-jedi'
"Jedi vim
Plug 'davidhalter/jedi-vim'
"C-family completion
Plug 'zchee/deoplete-clang'
"  Support for virtualenv
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'plytophogy/vim-virtualenv'
" Syntax checker (supports Python)
Plug 'w0rp/ale'
" File explorer
Plug 'scrooloose/nerdtree'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Solarized colorscheme
Plug 'iCyMind/NeoSolarized'
Plug 'altercation/vim-colors-solarized'
" Solarized colorscheme with neovim-qt support
Plug 'JulioJu/neovim-qt-colors-solarized-truecolor-only'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

"================================================
" Basic Settings
"================================================

" turn filetype detection, indent scripts and filetype plugins on
filetype plugin indent on
set encoding=utf-8
" copy indent from current line when starting a new line
set autoindent
" syntax highlighting
syntax enable
" Copies using system clipboard
set clipboard+=unnamedplus
" display line number relatively to the current one
set rnu
" highlight the current line and column
set cursorline
set cursorcolumn
" <tab> inserts spaces instead of tabs
set expandtab
" set softtabstop=0
" size of <tab> measured in spaces 
set tabstop=4
" size of an indent, 4 spaces to match <tab>
set shiftwidth=4
" enable mouse
set mouse=a
" disable text wrapping
set textwidth=0

"============================
" Colorscheme
"============================

" use solarized as colorscheme
" colorscheme kalisi "solarized
set termguicolors
" default value is "normal", Setting this option to "high" or "low" does use the 
" same Solarized palette but simply shifts some values up or down in order to 
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"
" Special characters such as trailing whitespace, tabs, newlines, when displayed 
" using ":set list" can be set to one of three levels depending on your needs. 
" Default value is "normal". Provide "high" and "low" options.
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1
set background=dark
colorscheme NeoSolarized

"============================
" Basic Mappings
"============================
" make jk to be esc
inoremap jk <ESC>
" splits behaviour
set splitbelow
set splitright
"Map leader to ,
let mapleader=","
"Map fzf to ;
map ; :Files<CR>
" Use gn or gp through buffers
map gn :bn<cr>
map gp :bp<cr>
" Use gd to delete buffer
map gd :bd<cr>  
"Clear search result shortcut
nnoremap <C-P> :noh<CR><C-L>
"Save and source vimrc with one command
nnoremap <F12> :so $MYVIMRC<CR>
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

"========================
" Deoplete Settings
"=======================

let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
"Path to python virtualenv where neovim is install
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete=1
let g:python_host_prog =  '/home/tbf/miniconda3/envs/neovim/bin/python'
let g:python3_host_prog = '/home/tbf/miniconda3/envs/neovim3/bin/python'
let g:deoplete#sources#jedi#python_path = 'python3'
let python_highlight_all = 1
nmap <silent> <C-m> <Plug>(pydocstring)

"========================
" Deoplete clang 
"========================
let g:deoplete#sources#clang#libclang_path ='/usr/lib/llvm-10/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

"========================
" UltiSnips   
"========================

" Snippet triggering commands
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"

"========================
" Easymotion
"========================
map <Leader> <Plug>(easymotion-prefix)

"========================
" Ale
"========================
nmap <silent> <C-W>k <Plug>(ale_previous_wrap)
nmap <silent> <C-W>j <Plug>(ale_next_wrap)

"========================
" NerdTree
"========================
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction
" toggle file explorer visibility
map <C-N> :NERDTreeToggle<CR>

"========================
" Jedi
"========================
let g:jedi#auto_close_doc = 0  " close scratch/preview window after completion
