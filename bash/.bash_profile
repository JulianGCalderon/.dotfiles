export EDITOR=hx
export XDG_CONFIG_HOME="$HOME/.config"

case $(uname) in
  Darwin*)
    [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac

[ -e "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[[ -r ~/.bashrc ]] && source "$HOME/.bashrc"
