# applepine1125's dotfiles
simply dotfiles for zsh, vim, tmux etc... and installing system using [Dotbot](https://github.com/anishathalye/dotbot)

## Dependencies
brew https://brew.sh/index_ja
## Installation  
### dotfiles
clone this repository and install dotfiles.
```
cd ~
git clone https://github.com/applepine1125/dotfiles
cd ~/dotfiles
./install
```

### brew package, App from cask and mas  
```
brew tap Homebrew/bundle
cd ~/dotfiles/brew
brew bundle 
```

If you want create Brewfile  
```
cd ~/dotfiles/brew
brew bundle dump --force
```

### installing tmux plugins
Press prefix + I (capital i, as in Install) to fetch the plugin.
https://github.com/tmux-plugins/tpm
