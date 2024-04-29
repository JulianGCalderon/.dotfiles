# PROMPT

autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%b"

precmd () { 
  vcs_info

  PROMPT="%{$fg[green]%}%~ "
  [[ -n $vcs_info_msg_0_ ]] && {
      if [[ -n $(git status --porcelain) ]]; then
        GIT_STATUS=" %{$fg[red]%}✗%{$fg[blue]%}"
      else
        GIT_STATUS=""
      fi
      PROMPT+="%{$fg[blue]%}($vcs_info_msg_0_$GIT_STATUS) "
  }
  PROMPT+="%{$reset_color%}"
}

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
