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

" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

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
" power-line
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
set encoding=utf8

" easymotion
let g:EasyMotion_leader_key=';'

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
	elseif &filetype=="python"
		let compile_options="true"
		let run_options="python %"
	endif
	exec "!xterm -geometry 80x32 -e \"". compile_options . " && " . "echo \"__COMPILED__\"" . " && " . run_options . "; read -n 1\""
endfunction

imap <F5> <ESC>:call CompileAndRun()<CR>
nmap <F5> <ESC>:call CompileAndRun()<CR>

" autoreload vimrc
autocmd! bufwritepost .vimrc source .vimrc

" fast copy the whole file to system clip
nmap <leader>a gg"+yG

" fast edit home vimrc
map <silent> <leader>e :e ~/.vimrc<cr>

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
