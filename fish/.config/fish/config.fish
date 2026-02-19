set -x EDITOR hx
set -x PATH /usr/local/go/bin $PATH
set -x PATH "$HOME/bin" $PATH
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/.go/bin" $PATH
set -x PATH "$HOME/.opencode/bin" $PATH

if type -q starship
    starship init fish | source
end
