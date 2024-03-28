# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

export PATH=$PATH:~/.local/scripts/
export PATH=$PATH:~/go/bin

source "$HOME/.cargo/env"

export EDITOR=hx
