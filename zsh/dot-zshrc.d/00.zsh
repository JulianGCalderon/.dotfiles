# PROMPT

autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%b"

precmd () { 
  vcs_info

  PROMPT="%{$fg[green]%}%~ "
  [[ -n $vcs_info_msg_0_ ]] && {
      [[ -n $(git status --porcelain) ]] && {
        GIT_STATUS=" %{$fg[red]%}✗%{$fg[blue]%}"
      }
      PROMPT+="%{$fg[blue]%}($vcs_info_msg_0_$GIT_STATUS) "
  }
  PROMPT+="%{$reset_color%}"
}

export COLORTERM=truecolor
