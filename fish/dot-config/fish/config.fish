if not status is-interactive
    return
end

zoxide init fish | source
starship init fish | source
direnv hook fish | source
source ~/.asdf/asdf.fish
source ~/.cargo/env.fish
