# applepine1125's dotfiles
simply dotfiles for zsh, vim,tmux etc... and installing system using [Dotbot](https://github.com/anishathalye/dotbot)

## Installation
clone this repository and install dotfiles.
```
cd ~
git clone https://github.com/applepine1125/dotfiles
dotfiles/install
```

install ricty font for powerline theme
```
$ brew update
$ brew uninstall ricty
$ brew tap sanemat/font
$ brew install --vim-powerline ricty
$ cp -f /usr/local/Cellar/ricty/{your directory version}/share/fonts/Ricty*.ttf ~/Library/Fonts/ 
$ fc-cache -vf
$ exec $SHELL -l
```
