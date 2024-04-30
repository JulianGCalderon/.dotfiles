nnn-cd()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running" >&2 
        return -1
    }

    # If set, `nnn` writes a `cd` the current working directory.
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # To `cd` quit only on ^G, don't export and use the default path:
    # NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    command nnn "$@"

    [ -f "$NNN_TMPFILE" ] && {
        source "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}
