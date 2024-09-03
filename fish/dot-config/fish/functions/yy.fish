function yy --wraps yazi --description 'yazi with cwd support'
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set cwd (command cat -- "$tmp")

    if [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end

    rm -f -- "$tmp"
end
