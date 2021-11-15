"==================================================
"                                                
"                                                
"         MY NEOVIM VIMRC FILE                   
"                                                
"                                                
"==================================================


"================================================= 
"               Plugins
"================================================= 
" Plugins will go here in the middle.
call plug#begin('~/.local/share/nvim/plugged')
" Coc-nvim autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Easymotion
Plug 'Lokaltog/vim-easymotion'
" Neoterm 
Plug 'kassio/neoterm'
"" File explorer
Plug 'scrooloose/nerdtree'
" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
"" Status line
Plug 'vim-airline/vim-airline'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Easy insert comment
Plug 'preservim/nerdcommenter'
" Git  helper
Plug 'tpope/vim-fugitive'
" Vimspector
Plug 'puremourning/vimspector' 
"Vim-ipython-cell
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
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
" Removes the "No write since last change (add ! to overwrite)
set hidden
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

"============================
" Colorscheme
"============================
"Color scheme Gruvbox 
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

"============================
" Basic Mappings
"============================
" make jk to be esc
inoremap jk <ESC>
" splits behaviour
set splitbelow
set splitright
"Map leader to ,
let mapleader="\<Space>"
" Use gn or gp through buffers
map gn :bn<cr>
map gp :bp<cr>
" Use gd to delete buffer
map gd :bd<cr>  
"Clear search result shortcut
nnoremap <Leader>p :noh<CR><C-L>
"Save and source vimrc with one command
nnoremap <Leader>m :w <bar> :so $MYVIMRC<CR>
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
"Mapping unused norvegian letters
"in normal mode to letters with
"are difficult to type on a
"norwegian keyboard
nnoremap ø {
nnoremap æ }
nnoremap Ø (
nnoremap Æ )
"nnoremap å 0
"nnoremap Å $
vnoremap ø {
vnoremap æ }
vnoremap Ø (
vnoremap Æ )
"vnoremap å \
"vnoremap Å `

"============================
" Auto commands
"============================
" remove blank characters at the end of every line when saving file,
" need to be disabled for some filetypes like markdown or latex
" where trailing spaces are important
autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

"============================
" Path to python 
"============================
let g:python_host_prog =  '/home/tbf/miniconda3/envs/neovim/bin/python'
let g:python3_host_prog = '/home/tbf/miniconda3/envs/neovim3/bin/python'

"Vim-ipython-cell
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

"========================
" Neoterm settings 
"=======================
"Map Esc to end terminal mode
:tnoremap <Esc> <C-\><C-n>
"Open terminal at bottom
let g:neoterm_size = '8'
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'botright' 
let g:neoterm_autoinsert = 1 
" Send files, line or selection to last terminal 
"nnoremap <silent> <leader>nf :TREPLSendFile<cr><esc> nnoremap <silent> <leader>nl :TREPLSendLine<cr><esc>
"vnoremap <silent> <leader>ns :TREPLSendSelection<cr><esc>
" open and hide/close last terminal terminals
nnoremap <silent> <C-p> :Ttoggle<cr>
tnoremap <silent><c-p>  <c-\><c-n>:Ttoggle<cr>

"========================
" Vim-Slime 
"=======================
"Turn of vim-slime mappings
let g:slime_no_mappings = 1

"========================
" Vim-Ipython-cell 
"=======================

"Default to neovim terminal
let g:slime_target = "neovim"
" fix paste issues in ipython
let g:slime_python_ipython = 1
" IPython send to command
autocmd filetype python nnoremap <buffer>  <silent> <leader>nf :IPythonCellRun<cr> 
autocmd filetype python nmap <buffer> <silent>      <leader>nm <Plug>SlimeParagraphSend
autocmd filetype python xmap <buffer> <silent>      <leader>nr <Plug>SlimeRegionSend 
"This should work for all filetypes
nnoremap <silent>                                   <leader>nh :SlimeSendCurrentLine<CR> 
nnoremap <c-c>v                                                <Plug>SlimeConfig

"========================
" Coc-nvim
"========================
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"Open defintion in new window
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"========================
" Coc-pyright
"========================

"========================
" Fzf
"========================
"Map fzf to ;
map ; :FZF<CR>

"========================
" Easymotion
"========================
"map <Leader> <Plug>(easymotion-prefix)

"========================
" Vimspector
"========================
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
"nmap <F11>      :call vimspector#StepInto()<CR>
"nmap <leader>vn :call vimspector#StepInto()<CR>
nmap <leader>vr :VimspectorReset<CR>

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

"============================
" Commands
"============================
"Execute Python
autocmd filetype python map <buffer> <leader>r       :w<cr>:exec '!python3' shellescape(@%, 1)<cr>
autocmd FileType python imap <buffer> <leader>r <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"Compile and run C
autocmd filetype c nnoremap <leader>r                :w<cr> :!clear<cr> :!gcc % -o %< && ./%<<CR>

