set nobackup
set noswapfile
set autoread
set showcmd

syntax on
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

" remap
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/matsuyuki/.vim/bundle/repos/github.com/Shougo/dein.vim

  " Required:
  call dein#begin('/Users/matsuyuki/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Load toml
  call dein#load_toml('/Users/matsuyuki/.vim/bundle/rc/dein.toml', {'lazy': 0})
  call dein#load_toml('/Users/matsuyuki/.vim/bundle/rc/dein_lazy.toml', {'lazy': 1})

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tomasr/molokai')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Add nerd tree
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  " Required:
  call dein#end()

  " Required:
  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif

  "End dein Scripts-------------------------

" autocmd VimEnter * execute 'NERDTree'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
