# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' format '%U%BCompleting %d%b%u'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/vincent/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

bindkey '^R' history-incremental-search-backward

alias la="ls -a --color=auto"
alias ll="ls -lh --color=auto"
alias ls="ls --color=auto"
alias lla="ls -lah --color=auto"
alias -s t2t="vim"
alias aptitude="sudo aptitude"
alias install="sudo apt-get install"

# prompt
PS1="%F{green}%n%f@%{%F{yellow}%}%M%{%f%}:%{%F{cyan}%}%~%{%f%}$ "
export PATH=$PATH:/sbin:/usr/sbin

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}
 export PYTHONSTARTUP='/home/vincent/.pyrc'
