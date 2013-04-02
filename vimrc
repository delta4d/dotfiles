"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible		" be iMproved
filetype off			" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-script repos
Bundle 'taglist.vim'
Bundle 'clang-complete'
Bundle 'snipMate'
Bundle 'matchit.zip'
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'peaksea'
"Bundle 'molokai'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vimwiki'

" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'myusuf3/numbers.vim'
Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'tpope/vim-markdown'
"Bundle 'chriskempson/tomorrow-theme'

filetype plugin indent on		" required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" If using gvim
if has("gui_running")
	set lines=40
	set columns=80
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set guioptions-=L
	set guioptions+=e
	set guitablabel=%M\ %t
"	set t_Co=256
	set background=dark
	colorscheme Tomorrow-Night
endif

set encoding=utf8
set fileencodings=utf8,gb2312,gbk,gb18030
set fileencoding=utf8
set fileformats=unix,dos,mac
syntax enable
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 10
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
set nobackup
set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim power-line
set laststatus=2
"set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

" easymotion
let g:EasyMotion_leader_key=';'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Defined Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" return dict[key]
function! Getv(dict, key)
	if has_key(a:dict, a:key)
		return a:dict[a:key]
	else
		return "true"
	endif
endfunction

" define how to run a program
function! Run()
	let compile_options = {
			\'c'       : 'gcc -O2 -Wall -D__DELTA__ %',
			\'cpp'     : 'g++ -O2 -Wall -D__DELTA__ %',
			\'java'    : 'javac %'
		\}
	let run_options = {
			\'c'       : './a.out',
			\'cpp'     : './a.out',
			\'java'    : 'java %',
			\'ruby'    : 'ruby %',
			\'python'  : 'python %',
			\'sh'      : 'sh %'
		\}
	let compile_cmd = Getv(compile_options, &filetype)
	let run_cmd = Getv(run_options, &filetype)
	let compile_run = compile_cmd . ' && echo __COMPILED__  && ' . run_cmd
	exec 'w'
	exec '!clear && xterm -geometry 80x32 -e ' . '"' . compile_run . ' ; read -n 1' . '"'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" run run run
imap <F5> <ESC>:call Run()<CR>
nmap <F5> <ESC>:call Run()<CR>

" Fast saving
nmap <leader>w :w!<cr>

" autoreload vimrc
" autocmd! bufwritepost .vimrc source .vimrc

" fast copy the whole file to system clip
nmap <leader>a gg"+yG

" source .vimrc
nmap <leader><leader> :source ~/.vimrc<cr>

" fast edit home vimrc
map <silent> <leader>e :split<ESC>:e ~/.vimrc<cr>

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" treat long lines as break lines
map j gj
map k gk

" NERDTree
map <F9> :NERDTree<CR>

" numbers.vim
map <F8> :NumbersToggle<CR>
