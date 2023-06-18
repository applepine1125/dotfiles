# Ensure that a non-login, non-interactive shell has a defined environment.
# zmodload zsh/zprof && zprof
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# starting profie zsh
# zmodload zsh/zprof && zprof
