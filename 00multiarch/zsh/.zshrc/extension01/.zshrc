
export EDITOR='/usr/bin/vim'
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

autoload -Uz compinit && compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


alias l='ls --color'
alias ll='ls -al --color'

  setopt auto_cd
  setopt auto_pushd
  #setopt beep
  setopt extended_glob
  setopt glob_dots
  setopt hist_ignore_all_dups
  setopt hist_no_store
  setopt prompt_subst
  setopt share_history
unsetopt mark_dirs

autoload -Uz promptinit && promptinit
PROMPT="%{%K{red}%}%n@%m%k %B%F{orange}%(4~|...|)%3~%F{green} %# %b%f%k"
X_HOUR="%D{%H:%M:%S}"
RPS1="%K{blue}${X_HOUR}%k ${${KEYMAP/vicmd/<<<}/(main|viins)/>>>}"

function zle-line-init zle-keymap-select {
    PR_BLACK='%K{black}'
    PR_RED='%K{red}'
    PR_GREEN='%K{green}'
    PR_RESET='%k'
    PR_VIMODE="${${KEYMAP/vicmd/<<<}/(main|viins)/>>>}"
    PR_VICOLOR="${${KEYMAP/vicmd/${PR_RED}}/(main|viins)/${PR_GREEN}}"
    RPS1="%K{blue}%D{%H:%M:%S}%k ${PR_VICOLOR}${PR_VIMODE}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


# Include non-hidden directories in globbed file completions
# for certain commands
zstyle ':completion::complete:*' \
 tag-order 'globbed-files directories' all-files 
zstyle ':completion::complete:*:tar:directories' file-patterns '*~.*(-/)'

bindkey -v
bindkey jj vi-cmd-mode
bindkey -M vicmd v edit-command-line

alias -g ...=../..
alias -g ....=../../..

alias ,mu="~/.0x1/00mu/ && l"
alias ,do="~/_/00down/ && ll"
alias ,tr="/00transfert/ && ll"
alias ,si="~/c1p_skethio_instant/ && ll"
alias md='mkdir -p'
alias rd='rmdir -p'
alias di='dirs -v'

alias -s -- ttf='kfontview'

zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

autoload -U edit-command-line
zle -N edit-command-line

autoload -U zmv

# vim: ft=zsh colorcolumn=79 expandtab
