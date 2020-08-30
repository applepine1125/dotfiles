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
### terminal.app theme  
Open terminal.app settings, click `Import`, and select file Solarized_fixed.terminal in `~/dotfiles`

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


### ricty font for powerline theme  
```
brew update
brew uninstall ricty
brew tap sanemat/font
brew install ricty  --with-powerline
cp -f /usr/local/Cellar/ricty/{your directory version}/share/fonts/Ricty*.ttf ~/Library/Fonts/ 
fc-cache -vf
exec $SHELL -l
```
Then, set font *ricty for powerline* in terminal settings

### vim, neovim
If get errors concerned python, install python3 and reinstall pynvim using pip 
```
python3 -m pip install --user --upgrade pynvim
```

