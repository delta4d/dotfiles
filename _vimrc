set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim

" Sets how many lines of history VIM to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" If using gvim
if has("gui_running")
	set lines=50
	set columns=100
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set guioptions-=L
	set guioptions+=e
	set guitablabel=%M\ %t
	set t_Co=256
	set background=dark
"	colorscheme peaksea
	colorscheme molokai
endif

set encoding=utf8
set fileencodings=utf8,gb2312,gbk,gb18030
set fileencoding=utf8
set fileformats=unix,dos,mac
syntax enable
set guifont=Consolas:h10,微软雅黑:h10
set nobackup
set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
"set cindent
set incsearch " match while typing
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" listchars
set listchars=trail:~,precedes:«,extends:»,eol:¬,tab:»·
set list

" 80
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=9
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.cu set filetype=cpp
au BufRead,BufNewFile *.hs set sw=4 ts=4 et
au BufRead,BufNewFile *.rb set sw=2 ts=2 et

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" statusline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1   guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000    guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shellslash
set grepprg=grep\ -nH\ $*
filetype plugin indent on
let g:tex_flavor='latex'
set iskeyword+=:

" vimwiki
let g:vimwiki_use_mouse = 1

" c++11 syntax
"let g:cpp_class_scope_highlight = 1
"let g:cpp_experimental_template_highlight = 1

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
			\'cpp'     : 'g++ --std=c++0x -O2 -Wall -D__DELTA__ %',
			\'java'    : 'javac %',
			\'tex'     : 'pdflatex %' 
		\}
	let run_options = {
			\'c'       : 'a',
			\'cpp'     : 'a',
			\'java'    : 'java %',
			\'ruby'    : 'ruby %',
			\'python'  : 'python %',
			\'sh'      : 'sh %',
			\'haskell' : 'runghc -Wall %',
			\'tex'     : 'SumatraPDF %',
			\'go'	   : 'go run %'
		\}
	let compile_cmd = Getv(compile_options, &filetype)
	let run_cmd = Getv(run_options, &filetype)
	let compile_run = compile_cmd . ' && echo __COMPILED__  && ' . run_cmd
	exec 'w'
	exec '!' . compile_run
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" back to normal!
imap jk <ESC>

" run run run
imap <F5> <ESC>:call Run()<CR>
nmap <F5> <ESC>:call Run()<CR>

function! C98()
	exec 'w'
	exec '!g++ -Wall -O2 -D__DELTA__ % && echo __COMPILED__ && a'
endfunction

imap <F6> <ESC>:call C98()<CR>
nmap <F6> <ESC>:call C98()<CR>

nmap <leader>t :call InsertTemlate()<CR>

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

" set paste
map <F2> :set paste<CR>

" set nopaste
map <F3> :set nopaste<CR>
