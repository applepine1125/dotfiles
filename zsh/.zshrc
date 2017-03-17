#vi bind
#bindkey -v

#nvim設定ファイル設定
export XDG_CONFIG_HOME=~/.config

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# コマンドのスペルを訂正
setopt correct

# ビープ音を鳴らさない
setopt no_beep

# tmuxでブランチ表示設定
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
#alias vim='vim'
alias cat='cat -n'
alias less='less -NM'
# pyenvに乗っ取られたcondaのコマンドパス設定
alias source='source '
alias activate=/Users/matsuyuki/.anyenv/envs/pyenv/versions/anaconda3-4.3.0/bin/activate
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#anyenv
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

#golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$PATH
