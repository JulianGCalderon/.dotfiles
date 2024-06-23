export EDITOR=hx
export XDG_CONFIG_HOME="$HOME/.config"

case $(uname) in
  Darwin*)
    [ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac
