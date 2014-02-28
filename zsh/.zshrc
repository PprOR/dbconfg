# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' format '%U%BCompleting %d%b%u'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/vincent/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch hist_ignore_all_dups hist_ignore_space csh_junkie_history
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

bindkey '^R' history-incremental-search-backward

alias -s c="vim"
alias -s js="vim"
alias -s t2t="vim"
alias -s pdf="google-chrome-stable"
alias -s jpg="google-chrome-stable"
alias grep="grep -n --color=auto"
alias la="ls -a --color=auto"
alias less="/usr/share/vim/vim74/macros/less.sh"
alias ll="ls -lh --color=auto"
alias lla="ls -lah --color=auto"
alias ls="ls --color=auto"
alias mv=' timeout 8 mv -iv'
alias rm=' timeout 3 rm -Iv --one-file-system'
alias s="sudo -E zsh"
alias sudo="sudo -E"
alias mkcd='_(){ mkdir $1; cd $1; }; _'
setopt completealiases

# prompt
PS1="%F{green}%n%f@%{%F{yellow}%}%M%{%f%}:%{%F{cyan}%}%3~%{%f%}$ "
export PATH=$PATH:/sbin:/usr/sbin:~/.gem/ruby/2.0.0/bin
export EDITOR=vim

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}
export PYTHONSTARTUP='/home/vincent/.pyrc'
export TERM=xterm-256color

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search




DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus




source ~/.zshrc.local
source /usr/share/doc/pkgfile/command-not-found.zsh
