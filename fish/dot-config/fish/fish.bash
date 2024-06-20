#!/bin/bash
#
# Executes fish from bash.
# Should be sourced by .bashrc.

# ignore if is not interactive
[[ $- == *i* ]] || {
    return
}

# ignore if parent is fish
[[ $(ps --no-header --pid=$PPID --format=comm) != "fish" ]] || {
    return
}

# get login option
shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''

# execute fish
exec fish $LOGIN_OPTION
