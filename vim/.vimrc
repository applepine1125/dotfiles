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
set updatetime=100" refresh timing of vim-gitgutter
let NERDTreeShowHidden=1
let g:vim_markdown_folding_disabled=1
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:latex_latexmk_options = '-pdfdvi -pvc -gg'
let g:vimtex_compiler_latexmk = {'callback' : 0}

"--------------------------------------------
"# dein setup
"--------------------------------------------
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

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"--------------------------------------------
"# hybrid colorscheme
"--------------------------------------------
" let g:hybrid_custom_term_colors = 1
filetype plugin indent on
syntax enable
set background=dark
colorscheme hybrid


"--------------------------------------------
"# vim-airline settings
"--------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'molokai'


"--------------------------------------------
"# neocomplete settings
"--------------------------------------------
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


"--------------------------------------------
"# neosnippet settings
"--------------------------------------------
" Plugin key-mappings.
"  Note: It must be "imap" and "smap".  It uses <Plug> mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"--------------------------------------------
"# NERDtree, NERDTreeTabs settings
"--------------------------------------------
" autocmd VimEnter * execute 'NERDTree'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
map <C-e> :NERDTreeTabsToggle<CR>


"--------------------------------------------
"# ale settings
"--------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

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
"# syntastic settings
"--------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" " let g:syntastic_mode_map = { 'mode': 'active'}
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" " hi SyntasticErrorSign ctermfg=160
" " hi SyntasticWarningSign ctermfg=220
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_go_checkers = ['go', 'golint']
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_javascript_checkers = ['jslint']

"--------------------------------------------
"# ctrlp settings
"--------------------------------------------
" Prefix: s
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'


"--------------------------------------------
"# ack settings
"--------------------------------------------
let g:ackprg = 'ag --nogroup --nocolor --column'


"--------------------------------------------
"# easymotion settings
"--------------------------------------------
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
