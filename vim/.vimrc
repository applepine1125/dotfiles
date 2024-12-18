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

" moving buffer settings
nnoremap Bp :bprevious<CR>
nnoremap Bn :bnext<CR>
nnoremap Bb :b#<CR>
nnoremap Bf :bf<CR>
nnoremap Bl :bl<CR>
nnoremap Bm :bm<CR>
nnoremap Bd :bdelete<CR>

let mapleader = "\<Space>"

" completion quotes, brackets
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>

" autocmd
au BufRead,BufNewFile *.tf set filetype=terraform 
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
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
    call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
   let s:dir = 'dein.vim'->fnamemodify(':p')
   if !(s:dir->isdirectory())
     let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
     if !(s:dir->isdirectory())
       execute '!git clone https://github.com/Shougo/dein.vim' s:dir
     endif
   endif
   set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif

" Load plugins
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein_dir . '/rc/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . '/rc/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable


"--------------------------------------------
"# colorscheme settings
"--------------------------------------------
colorscheme hybrid
set background=dark
syntax enable

" bracket highlighting color setting
hi MatchParen cterm=bold ctermbg=none ctermfg=lightgrey

"--------------------------------------------
"# vim-lsp settings
"--------------------------------------------
nmap gf :LspDefinition<CR> 
nmap gt :LspTypeDefinition<CR>
nmap gj :LspDeclaration<CR>
nmap gi :LspImplementation<CR>
nmap gr :LspReferences<CR>
nmap gF <C-o> " back from definition 
nmap gn :LspRename<CR>

let g:lsp_settings_filetype_go = ['gopls']
let g:lsp_diagnostics_enabled = 0 " disable linter error popups
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_text_edit_enabled = 0

"--------------------------------------------
"# asyncomplete settings
"--------------------------------------------
let g:asyncomplete_auto_popup = 1

let g:asyncomplete_popup_delay = 200 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)

"--------------------------------------------
"# vim-lsp-snippets settings
"--------------------------------------------
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
set completeopt+=menuone


"--------------------------------------------
"# fzf settings
"--------------------------------------------
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ''

"--------------------------------------------
"# vim-airline settings
"--------------------------------------------
let g:airline#extensions#disable_rtp_load=1
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'molokai'

"--------------------------------------------
"# NERDtree, NERDTreeTabs settings
"--------------------------------------------
let NERDTreeShowHidden = 1
" autocmd VimEnter * if argc() ==  0 && !exists("s:std_in") | NERDTree | endif
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
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"--------------------------------------------
"# tcomment_vim settings
"--------------------------------------------
if !exists('g:tcomment_types')
	let g:tcomment_types = {}
endif
let g:tcomment_types['toml'] = '# %s'

"--------------------------------------------
"# vim-markdown settings
"--------------------------------------------
let g:vim_markdown_conceal = 1
let g:previm_show_header = 0
let g:vim_markdown_folding_disabled = 2

"--------------------------------------------
"# gotests-vim settings
"--------------------------------------------
let g:gotets_bin = $GOPATH . '/bin/gotests'

"--------------------------------------------
"# vim-terraform settings
"--------------------------------------------
let g:terraform_fmt_on_save = 1

"--------------------------------------------
"# uml settings
"--------------------------------------------
au BufRead,BufNewFile *.uml set filetype=uml
au BufRead,BufNewFile *.puml set filetype=uml
let g:preview_uml_url='http://localhost:8888'

"--------------------------------------------
"# rust settings
"--------------------------------------------
let g:rustfmt_autosave = 1
