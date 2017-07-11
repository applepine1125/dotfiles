if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/matsuyuki/dotfiles/vim/.vim/init.vim', '/Users/matsuyuki/.vim/bundle/rc/dein.toml', '/Users/matsuyuki/.vim/bundle/rc/dein_lazy.toml', '/Users/matsuyuki/.vim/bundle/rc/deineo.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/matsuyuki/.vim/bundle'
let g:dein#_runtime_path = '/Users/matsuyuki/.vim/bundle/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/matsuyuki/.vim/bundle/.cache/init.vim'
let &runtimepath = '/Users/matsuyuki/.vim/bundle/repos/github.com/Shougo/dein.vim/,/Users/matsuyuki/.config/nvim,/etc/xdg/nvim,/Users/matsuyuki/.local/share/nvim/site,/usr/local/share/nvim/site,/Users/matsuyuki/.vim/bundle/repos/github.com/Shougo/dein.vim,/Users/matsuyuki/.vim/bundle/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.2.0_1/share/nvim/runtime,/Users/matsuyuki/.vim/bundle/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/matsuyuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/matsuyuki/.config/nvim/after'
filetype off
let g:deoplete#enable_at_startup = 1
