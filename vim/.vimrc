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

" reset augroup
"augroup MyAutoCmd
"autocmd!
"augroup END

"# grep settings
autocmd QuickFixCmdPost *grep* cwindow
if executable('jvgrep')
  set grepprg=jvgrep
endif

"change line number color
autocmd ColorScheme * highlight LineNr ctermfg=245

"--------------------------------------------
"# dein setup
"--------------------------------------------
let s:dein_dir = $HOME . '/.vim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

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
  if has('nvim')
    call dein#load_toml(s:dein_dir . '/rc/dein_neo.toml', {'lazy': 0})
  endif
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
set background=dark
filetype plugin indent on
syntax enable
"au MyAutoCmd VimEnter * nested colorscheme hybrid 
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
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"--------------------------------------------
"# jedi-vim settings
"--------------------------------------------
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<C-Space>"
let g:jedi#goto_assignments_command = "<C-g>"
let g:jedi#goto_definitions_command = "<C-d>"
let g:jedi#documentation_command = "<C-k>"


"--------------------------------------------
"# vim-go settings
"--------------------------------------------
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:go_fmt_command = "goimports"
nmap gs <Plug>(go-def-split)

"--------------------------------------------
"# vimtex settings
"--------------------------------------------
au BufRead,BufNewFile *.tex set filetype=tex
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'callback': 1,
      \ 'continuous': 1,
      \ 'options': [
      \    '-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',
      \],
      \}
let g:vimtex_compiler_progname ='nvr'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
" let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
" function! UpdateSkim(status)
"   if !a:status | return | endif
"
"   let l:out = b:vimtex.out()
"   let l:tex = expand('%:p')
"   let l:cmd = [g:vimtex_view_general_viewer, '-r']
"   if !empty(system('pgrep Skim'))
"     call extend(l:cmd, ['-g'])
"   endif
"   if has('nvim')
"     call jobstart(l:cmd + [line('.'), l:out, l:tex])
"   elseif has('job')
"     call job_start(l:cmd + [line('.'), l:out, l:tex])
"   else
"     call system(join(l:cmd
"           \ + [line('.'),
"           \    shellescape(l:out),
"           \    shellescape(l:tex)],
"           \ ' '))
"   endif
" endfunction
" " endif
"
" if (!has('clientserver') || !has('gui_running'))
"   let g:vimtex_compiler_latexmk['callback'] = 0
" endif

"--------------------------------------------
"# vim-markdown settings
"--------------------------------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0
let g:previm_show_header = 0


"--------------------------------------------
"# neosnippet settings
"--------------------------------------------
" Plugin key-mappings.
"  Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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
let NERDTreeShowHidden=1
autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeTabsToggle<CR>


"--------------------------------------------
"# ale settings
"--------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_use_global  = 1
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
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
"# ctrlp settings
"--------------------------------------------
" Prefix: s
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'


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


"--------------------------------------------
"# easyAlign settings
"--------------------------------------------
nmap ga <Plug>(EasyAlign)
