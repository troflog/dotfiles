"================================================== 
"         MY NEOVIM VIMRC FILE                   
"                                                
"                                                
"==================================================


"================================================= 
"               Plugins
"================================================= 
"
" Install vim plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will go here in the middle.
call plug#begin('~/.local/share/nvim/plugged')
" Coc-nvim autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Easymotion
Plug 'Lokaltog/vim-easymotion'
" Neoterm 
Plug 'kassio/neoterm'
" File explorer
Plug 'scrooloose/nerdtree'
" Gruvbox colorscheme
"Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"" Status line
Plug 'vim-airline/vim-airline'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 "Easy insert comment
Plug 'preservim/nerdcommenter'
" Git  helper
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'tpope/vim-fugitive'
" Vimspector
Plug 'puremourning/vimspector' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
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
"set cursorline
"set cursorcolumn
" <tab> inserts spaces instead of tabs
set expandtab
" set softtabstop=0
" size of <tab> measured in spaces 
set tabstop=4
" size of an indent, 4 spaces to match <tab>
set shiftwidth=4
" enable mouse
set mouse=a
" disable text wrapping set textwidth=0

"============================
" Colorscheme
"============================
"Color scheme Gruvbox 
"autocmd vimenter * ++nested colorscheme gruvbox
"set bg=dark
"let g:gruvbox_contrast_dark='hard'
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"colorscheme tokyonight
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
map gj :bp<cr>
" Use gd to delete buffer
map gd :bd<cr>  
"Clear search result shortcut
nnoremap <Leader>p :noh<CR><C-L>
"Save and source vimrc with one command
nnoremap <Leader>m :w <bar> :so $MYVIMRC<CR>
"
nnoremap <Leader>n :b<Space>
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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
"Open terminal at bottom let g:neoterm_size = '8'
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'botright' 
let g:neoterm_autoinsert = 1 
" Send files, line or selection to last terminal 
nnoremap <silent> <leader>sl :TREPLSendFile<cr><esc> nnoremap <silent> <leader>nl :TREPLSendLine<cr><esc>
vnoremap <silent> <leader>ss :TREPLSendSelection<cr><esc>
" open and hide/close last terminal terminals
nnoremap <silent> <C-p> :Ttoggle<cr>
tnoremap <silent><c-p>  <c-\><c-n>:Ttoggle<cr>

"========================
" Coc-nvim
"========================
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more sbpbace for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"Use <cr> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"To make <cr> select the first completion item and confirm the completion when no item has been selected:
  
"Open kefintion in new window
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
autocmd filetype python nmap <buffer> <leader>r       :w<cr>:exec '!python3' shellescape(@%, 1)<cr>
"autocmd FileType python imap <buffer> <leader>r <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"Compile and run C
autocmd filetype c nmap <leader>r                :w<cr> :!clear<cr> :!gcc % -o %< && ./%<<CR>

nmap <F29> :echo "C-F5" <cr>
nmap <F30> :echo "C-F6" <cr>
nmap <F33> :echo "C-F9" <cr>
nmap <F29> :echo "C-F5" <cr>

nmap <C-S-F9> :echo "S-C-F9"<cr>
nmap <C-CR> :echo "trond"<cr>
