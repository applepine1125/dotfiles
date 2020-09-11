if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$(brew --prefix asdf)/etc/bash_completion.da:$FPATH

  autoload -Uz compinit
  compinit -C
fi


export LANG=ja_JP.UTF-8

# local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# history setting
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

#for neovim 
export XDG_CONFIG_HOME=$HOME/.vim

if [ -e /usr/local/share/zsh/functions ]; then
  fpath=(/usr/local/share/zsh/functions $fpath)
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed
setopt correct
setopt no_beep

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cat='cat -n'
alias less='less -NM'
alias source='source '

# asdf(manage multiple runtime versions) setup
. $(brew --prefix asdf)/asdf.sh

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#cask settings
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#--------------------
#prezto
#--------------------
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#--------------------
#golang
#--------------------
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$PATH
eval $(/usr/libexec/path_helper -s)

#--------------------------------------------
# peco settings
#--------------------------------------------
setopt hist_ignore_all_dups

function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

#--------------------------------------------
# gcloud settings
#--------------------------------------------
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/matsuyuki/go/bin/msg msg

#--------------------------------------------
# flutter settings
#--------------------------------------------
export PATH=$PATH:$HOME/flutter/bin

#--------------------------------------------
# fzf settings
#--------------------------------------------
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# show branch in tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


#--------------------------------------------
# asdf settings
#--------------------------------------------
export PATH=$HOME/.asdf/bin:$PATH

. /usr/local/opt/asdf/asdf.sh

# end profile zsh
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
#


#--------------------------------------------
# terraform settings
#--------------------------------------------
complete -o nospace -C ~/.asdf/shims/terraform terraform
