#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

ulimit -n 10000
export PATH=/usr/local/Cellar/openssl/1.0.2m/bin:/Users/matsuyuki/.anyenv/envs/rbenv/shims:/Users/matsuyuki/.anyenv/envs/pyenv/shims:/Users/matsuyuki/.anyenv/envs/nodenv/shims:/Users/matsuyuki/.anyenv/envs/rbenv/shims:/Users/matsuyuki/.anyenv/envs/rbenv/bin:/Users/matsuyuki/.anyenv/envs/pyenv/shims:/Users/matsuyuki/.anyenv/envs/pyenv/bin:/Users/matsuyuki/.anyenv/envs/nodenv/shims:/Users/matsuyuki/.anyenv/envs/nodenv/bin:/Users/matsuyuki/.anyenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Library/TeX/texbin:/Users/matsuyuki/go:/Users/matsuyuki/go/bin:/Users/matsuyuki/.zplug/bin:/usr/local/sbin:/Users/matsuyuki/.anyenv/envs/rbenv/shims:/Users/matsuyuki/.anyenv/envs/pyenv/shims:/Users/matsuyuki/.anyenv/envs/nodenv/shims:/Users/matsuyuki/.anyenv/envs/rbenv/bin:/Users/matsuyuki/.anyenv/envs/pyenv/bin:/Users/matsuyuki/.anyenv/envs/nodenv/bin:/Users/matsuyuki/.anyenv/bin:/usr/local/go/bin
