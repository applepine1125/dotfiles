# applepine1125's dotfiles
simply dotfiles and installing system using [Dotbot](https://github.com/anishathalye/dotbot)

## Installation
If your machine not install brew yet, you need to install it.
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

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
$ cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/ 
$ fc-cache -vf
$ exec $SHELL -l
```
