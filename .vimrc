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
Plugin 'lervag/vimtex'
Plugin 'habamax/vim-sendtoterm'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
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
nnoremap <F12> :w <bar> :so $MYVIMRC<CR>
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
"let g:ycm_semantic_triggers = { 'c': [ 're!\w{2}' ],'python': [ 're!\w{2}' ]}
"Need to point to this file in order to use autocomplete in c
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'
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
let g:UltiSnipsJumpForwardTrigger = '<C-n>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsListSnippets='<C-b>'
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsUsePythonVersion = 2

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
"Compile and run C
autocmd Filetype c nnoremap <f9> :w<cr> :!clear<cr> :!gcc % -o %< && ./%<<CR>

"============================
" Custom functions 
"============================

"Custom function to toggle terminal on/off
function! PutTermPanel(buf, side, size) abort
  " new term if no buffer
  if a:buf == 0
    term
  else
    execute "sp" bufname(a:buf)
  endif
  " default side if wrong argument
  if stridx("hjklHJKL", a:side) == -1
    execute "wincmd" "J"
  else
    execute "wincmd" a:side
  endif
  " horizontal split resize
  if stridx("jkJK", a:side) >= 0
    if ! a:size > 0
      resize 6
    else
      execute "resize" a:size
    endif
    return
  endif
  " vertical split resize
  if stridx("hlHL", a:side) >= 0
    if ! a:size > 0
      vertical resize 6
    else
      execute "vertical resize" a:size
    endif
  endif
endfunction

function! s:ToggleTerminal(side, size) abort
  let tpbl=[]
  let closed = 0
  let tpbl = tabpagebuflist()
  " hide visible terminals
  for buf in filter(range(1, bufnr('$')), 'bufexists(bufname(v:val)) && index(tpbl, v:val)>=0')
    if getbufvar(buf, '&buftype') ==? 'terminal'
      silent execute bufwinnr(buf) . "hide"
      let closed += 1
    endif
  endfor
  if closed > 0
    return
  endif
  " open first hidden terminal
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)<0')
    if getbufvar(buf, '&buftype') ==? 'terminal'
      call PutTermPanel(buf, a:side, a:size)
      return
    endif
  endfor
  " open new terminal
  call PutTermPanel(0, a:side, a:size)
endfunction

nnoremap <silent>  <leader>t       :call <SID>ToggleTerminal('J', 6)<CR>i
tnoremap <silent> <leader>t  <C-w>N:call <SID>ToggleTerminal('J', 6)<CR>

