set nobackup
set noswapfile
set autoread
set showcmd

set autoindent
set expandtab
set tabstop=2
set backspace=2
set shiftwidth=2
set laststatus=2
set cursorline
set number
set showmatch

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set noswapfile
set nobackup


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
  endif

  set runtimepath+=/Users/matsuyuki/.vim/bundle/repos/github.com/Shougo/dein.vim

  call dein#begin('/Users/matsuyuki/.vim/bundle')

  " Load toml
  " all plugins listed in toml
  call dein#load_toml('/Users/matsuyuki/.vim/bundle/rc/dein.toml', {'lazy': 0})
  call dein#load_toml('/Users/matsuyuki/.vim/bundle/rc/dein_lazy.toml', {'lazy': 1})

  call dein#end()

  filetype plugin indent on
  colorscheme molokai
  syntax enable

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif

  "End dein Scripts-------------------------

" autocmd VimEnter * execute 'NERDTree'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
