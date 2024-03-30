# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

export PATH=$PATH:~/.local/scripts/
export PATH=$PATH:~/go/bin

[ -e "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -e /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=hx
