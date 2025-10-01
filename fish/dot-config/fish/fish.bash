#!/bin/bash
#
# Executes fish from bash.
# Should be sourced by .bashrc.

# ignore if is not interactive
[[ $- == *i* ]] || {
  return
}


# ignore if parent is fish
case $(uname) in
  Darwin*)
    [[ $(ps -p $PPID  -o comm=) != "fish" ]] || {
      return
    }
  ;;
  Linux*)
    [[ $(ps --pid=$PPID --no-header --format=comm) != "fish" ]] || {
      return
    }
  ;;
esac

# execute fish
exec fish -i
