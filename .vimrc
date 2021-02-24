"+++++++++++++++++++++++++++++++++++++++++++++++++
"
"
"          MY VIM VIMRC FILE                             
"
"
"+++++++++++++++++++++++++++++++++++++++++++++++++

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
"Do not like this
"Plugin 'c.vim'
Plugin 'oblitum/youcompleteme'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'morhetz/gruvbox' 
Plugin 'Lokaltog/vim-easymotion'
Plugin 'hanschen/vim-ipython-cell'
Plugin 'preservim/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
filetype plugin on
" Test area
" Track the engine.

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
set clipboard=unnamedplus
" display line number relatively to the current one
set number relativenumber
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
" splits behaviour
set splitbelow
set splitright
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=120
else
  " This is console Vim.
  if exists("+lines")
    set lines=45
  endif
  if exists("+columns")
    set columns=100
  endif
endif

"===========================
" Basic Mappings
"============================

" make jk to be esc
inoremap jk <ESC>
" splits behaviour
set splitbelow
set splitright
" map leader
let mapleader=","
"Map fzf to ;
map ; :Files<CR>
" Use gn or gp to move forward/backwards through buffers
map gn :bn<cr>
map gp :bp<cr>
" Use gd to delete buffer
map gd :bd<cr>  
"Clear search result shortcut
nnoremap <C-P> :noh<CR><C-L>
"Save and source vimrc with one command
nnoremap <F12> :so $MYVIMRC<CR>
" Set moving between windows to ctrl+hjkl
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-j> <C-w>j
" Same as over but for moving out of terminal
tnoremap <silent> <C-l> <C-w>l
tnoremap <silent> <C-h> <C-w>h
tnoremap <silent> <C-k> <C-w>k
tnoremap <silent> <C-j> <C-w>j
"Toggle nerdtree on/off with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
"close NERDTree if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Mapping unused norvegian letters
"in normal mode to letters with
"are difficult to type on a
"norwegian keyboard
nnoremap ø (
nnoremap æ )
nnoremap Ø {
nnoremap Æ }
nnoremap å 0
nnoremap Å $
vnoremap ø (
vnoremap æ )
vnoremap Ø {
vnoremap Æ }
vnoremap å \
vnoremap Å `
"============================
" Plugin settings
"============================

"Color scheme
"colorscheme vim-monokai-tasty
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

" Termdebug 
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Youcompleteme
" Use the first python executable it finds in PATH
let g:ycm_python_binary_path = 'python'
" Close prewview window after the user exit insert modus
let g:ycm_autoclose_preview_window_after_insertion = 1
"Make ycm completion menu inside comments
let g:ycm_complete_in_comments = 1 
"Trigger autocomplete after typing two letters
let g:ycm_semantic_triggers = { 'c': [ 're!\w{2}' ],'python': [ 're!\w{2}' ]}
"Need to point to this file in order to use autocomplete in c
let g:ycm_global_ycm_extra_conf = '/home/tbf/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" List of filetypes for which YCM should be turned off
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}

" UltiSnips   
" Snippet triggering commands
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"

"============================
" Auto commands
"============================
"
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

"Execute Python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
