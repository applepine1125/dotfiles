let [plugins, ftplugin] = dein#load_cache_raw(['/Users/matsuyuki/.vimrc', '/Users/matsuyuki/.vim/bundle/rc/dein.toml', '/Users/matsuyuki/.vim/bundle/rc/dein_lazy.toml'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/matsuyuki/.vim/bundle'
let g:dein#_runtime_path = '/Users/matsuyuki/.vim/bundle/.dein'
let &runtimepath = '/Users/matsuyuki/.vim/bundle/repos/github.com/Shougo/dein.vim/,/Users/matsuyuki/.vim,/Users/matsuyuki/.vim/bundle/.dein,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim80,/usr/local/share/vim/vimfiles/after,/Users/matsuyuki/.vim/after,/Users/matsuyuki/.vim/bundle/.dein/after'
