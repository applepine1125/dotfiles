autoload -Uz compinit
compinit -C
export MESSAGING_USER=matsuyuki

source ~/.zplug/init.zsh

export LANG=ja_JP.UTF-8
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

# show branch in tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cat='cat -n'
alias less='less -NM'
# command path setting of conda
alias source='source '
alias activate=/Users/matsuyuki/.anyenv/envs/pyenv/versions/anaconda3-4.3.0/bin/activate
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
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$PATH
export GO111MODULE=on
eval $(/usr/libexec/path_helper -s)

#--------------------
#aws
#--------------------
export AWS_PROFILE=development
#--------------------
#anyenv
#--------------------
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `find $HOME/.anyenv/envs -type d -d 1`
    do
      export PATH="$D/shims:$PATH"
    done
fi

#--------------------
#zplug
#--------------------
zplug "b4b4r07/emoji-cli"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
#
#--------------------
#tex
#--------------------

export BIBINPUTS=$BIBINPUTS:~/Dropbox/file/ACLab/ref-mendeley

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matsuyuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/matsuyuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/matsuyuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/matsuyuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/matsuyuki/go/bin/msg msg
