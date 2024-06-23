#!/bin/bash
#
# Executes fish from bash.
# Should be sourced by .bashrc.

# ignore if is not interactive
[[ $- == *i* ]] || {
    return
}


# ignore if parent is fish
case "$OSTYPE" in
    darwin*)
        [[ $(ps -p $PPID  -o comm=) != "fish" ]] || {
            return
        }
    ;;
    linux*)
        [[ $(ps --pid=$PPID --no-header --format=comm) != "fish" ]] || {
            return
        }
    ;;
esac


# get login option
shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''

# execute fish
exec fish $LOGIN_OPTION 
