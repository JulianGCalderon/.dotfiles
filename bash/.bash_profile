function append_path() {
  export PATH="$PATH:$1"
}

export EDITOR=hx
export XDG_CONFIG_HOME="$HOME/.config"

append_path "$HOME/bin"
append_path "$HOME/.local/bin"

case $(uname) in
  Darwin)
    [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac

# go
[[ -d "$HOME/.go" ]] && append_path "$HOME/.go/bin"

# aligned
[[ -d "$HOME/.aligned/bin" ]] && append_path "$HOME/.aligned/bin" 

# pyenv
command -v pyenv > /dev/null || {
  export PYENV_ROOT="$HOME/.pyenv"
  append_path "$PYENV_ROOT/bin"
}

# cargo
[[ -e "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# treat login shell as non-login shell
[[ -r ~/.bashrc ]] && source "$HOME/.bashrc"
