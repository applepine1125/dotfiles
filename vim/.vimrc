"## Set params
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
set number
set showmatch
set ignorecase
set smartcase
set list
set listchars=tab:--,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set updatetime=100 " refresh timing of vim-gitgutter
let NERDTreeShowHidden=1
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")


"## dein detup
let s:dein_dir = $HOME . '/.vim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " Load and cached toml
  " all plugins listed in toml
  call dein#load_toml(s:dein_dir . '/rc/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . '/rc/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"## neocomplete setting
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_lenth=2
let gLneocomplete#lock_buffer_name_pattern='\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
   let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


"## nerdtree setting
" autocmd VimEnter * execute 'NERDTree'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
