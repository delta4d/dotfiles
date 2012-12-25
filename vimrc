" {{{ Vundle
set nocompatible		" be iMproved
filetype off			" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-script repos
Bundle 'taglist.vim'

" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on		" required!
" }}}

" {{{ plugin settings

" power-line settings
set laststatus=2
set t_Co=256
let g:Powerline_symblos = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
set encoding=utf8

" }}}

" {{{ General
" Sets how many lines of history VIM to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" }}}

if has("gui_running")
	set guioptions-=T
	set guioptions-=m
	set guioptions+=e
	set lines=40 columns=80
	set guitablabel=%M\ %t
endif

set fileformats=unix,dos,mac
syntax enable
set background=dark
colorscheme peaksea 
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
set nobackup
set number
set tabstop=4
set shiftwidth=4
set autoindent
set cindent

" compile
function! CompileAndRun()
	exec "w"
	if &filetype=="cpp"
		let compile_options="g++ -Wall -O2 %"
		let run_options="./a.out"
	elseif &filetype=="java"
		let compile_options="javac %"
		let run_options="java Main"
	elseif &filetype=="ruby"
		let compile_options="true"
		let run_options="ruby %"
	endif
	exec "!xterm -geometry 80x32 -e \"". compile_options . " && " . "echo \"__COMPILED__\"" . " && " . run_options . "; read -n 1\""
endfunction

imap <F5> <ESC>:call CompileAndRun()<CR>
nmap <F5> <ESC>:call CompileAndRun()<CR>

nmap <leader>a gg"+yG
map <silent> <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>
