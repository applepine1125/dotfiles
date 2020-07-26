set nobackup
set noswapfile
set autoread
set autoindent
set expandtab
set tabstop=2
set backspace=2
set shiftwidth=2
set showcmd
set number
set showmatch
set matchtime=1
set ignorecase
set smartcase
set list
set listchars=tab:--,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set updatetime=100 " refresh timing for vim-gitgutter

filetype plugin indent on

" autocmd
au BufRead,BufNewFile *.uml set filetype=uml
au ColorScheme * highlight LineNr ctermfg=240
au QuickFixCmdPost *grep* cwindow
if executable('jvgrep')
  set grepprg=jvgrep
endif

"--------------------------------------------
"# dein setup
"--------------------------------------------
let s:dein_dir = $HOME . '/.vim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Install dein.vim if not installed yet
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Load plugins
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein_dir . '/rc/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . '/rc/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"--------------------------------------------
"# hybrid colorscheme
"--------------------------------------------
colorscheme hybrid
set background=dark
syntax enable


"--------------------------------------------
"# vim-airline settings
"--------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'molokai'


"--------------------------------------------
"# neosnippet settings
"--------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


"--------------------------------------------
"# NERDtree, NERDTreeTabs settings
"--------------------------------------------
let NERDTreeShowHidden = 1
autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeTabsToggle<CR>


"--------------------------------------------
"# ale settings
"--------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:lightline = {
      \'active': {
      \  'left': [
      \    ['mode', 'paste'],
      \    ['readonly', 'filename', 'modified', 'ale'],
      \  ]
      \},
      \'component_function': {
      \  'ale': 'ALEGetStatusLine'
      \}
      \ }

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"--------------------------------------------
"# easymotion settings
"--------------------------------------------
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


"--------------------------------------------
"# vim-lsp settings
"--------------------------------------------
nmap <silent> gd :LspDefinition<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0

"--------------------------------------------
"# vim-markdown settings
"--------------------------------------------
let g:vim_markdown_conceal = 1
let g:previm_show_header = 0
let g:vim_markdown_folding_disabled = 2
