# Ensure that a non-login, non-interactive shell has a defined environment.
# zmodload zsh/zprof && zprof
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    if [ -z "$TMUX" ]; then
        eval `/usr/libexec/path_helper -s`
    fi
fi

# starting profie zsh
# zmodload zsh/zprof && zprof
