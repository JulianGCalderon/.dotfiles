export EDITOR=hx
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:$HOME/.local/bin"

case $(uname) in
  Darwin)
    [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac

[ -e "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# treat login shell as non-login shell
[[ -r ~/.bashrc ]] && source "$HOME/.bashrc"
