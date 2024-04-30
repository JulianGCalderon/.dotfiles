# PROMPT

autoload -U colors && colors
autoload -Uz vcs_info

setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%{%F{blue}%}(%b%u%c%{%F{blue}%}) "
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%{%F{red}%}?"
zstyle ':vcs_info:*' stagedstr "%{%F{yellow}%}!"

precmd () {  vcs_info }
PROMPT='%{$fg[green]%}%~ $vcs_info_msg_0_%{$reset_color%}'

# HISTORY

HISTSIZE=10000
SAVEHIST=10000

# AUTOCOMPLETE

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zmodload zsh/complist

autoload -U compinit && compinit
_comp_options+=(globdots)

export COLORTERM=truecolor
