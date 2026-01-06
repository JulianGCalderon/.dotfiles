function append_path() {
  export PATH="$PATH:$1"
}

export EDITOR=hx
export XDG_CONFIG_HOME="$HOME/.config"

append_path "$HOME/bin"
append_path "$HOME/.local/bin"

case $(uname) in
  Darwin)

    # brew
    [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

  ;;
esac

# cargo
[[ -e "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# go
[[ -d "/usr/local/go" ]] && append_path "/usr/local/go/bin"
[[ -d "$HOME/.go" ]] && append_path "$HOME/.go/bin"

# julia
[[ -d "$HOME/.juliaup/bin" ]] && append_path "$HOME/.juliaup/bin"

# starkli
[[ -d "$HOME/.config/.starkli" ]] && . "$HOME/.config/.starkli/env"

# pyenv
command -v pyenv > /dev/null || {
  export PYENV_ROOT="$HOME/.pyenv"
  append_path "$PYENV_ROOT/bin"
}

# dprint
export DPRINT_INSTALL="$HOME/.dprint"
append_path "$DPRINT_INSTALL/bin"

# treat login shell as non-login shell
[[ -r ~/.bashrc ]] && source "$HOME/.bashrc"
