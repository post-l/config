#!/usr/bin/env zsh

# Completion

autoload -U compinit && compinit
setopt menu_complete
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/bin /usr/local/bin
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*' menu select
setopt correctall
autoload -U promptinit && promptinit
prompt adam2
mesg y

# General setup

set path='~/ /usr/bin /usr/include /usr/local/bin /usr/local/include /usr/local/share /usr/share/emacs/site-lisp /opt /opt/android-sdk/tools .'
set host='/usr/bin/hostname'
set shost='/usr/bin/hostname -s'
set mail='/var/spool/mail/$USER'

limit coredumpsize 0
unset autologout

USER_NICKNAME="ludovic post"
MAIL=$mail
PRINTER="post_l"
MANPATH=/usr/bin/man:/usr/local/man:/usr/share/man
RPROMPT=' %y %* %D{%d/%m/%Y}'

# History

HISTFILE=~/.zhistory

SAVEHIST=10000
HISTSIZE=10000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# Alias

alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'

alias la='ls -a'
alias lla='ls -la'

alias c='clear'
alias less='less --quiet'
alias s='cd ..'
alias df='df --human-readable'
alias du='du --human-readable'
alias m='mutt -y'
alias md='mkdir'
alias rd='rmdir'
alias upgrade='yaourt -Syu --aur'

alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'

alias xs='cd'
alias sl='ls'

alias 'cd..'='cd ..'
alias emacs='emacs -nw'

alias node='env NODE_NO_READLINE=1 rlwrap node'
alias nodejs='env NODE_NO_READLINE=1 rlwrap nodejs'

bindkey '^A'    beginning-of-line       # Home
bindkey "\e[1~" beginning-of-line
bindkey "\e[H"  beginning-of-line
bindkey '^E'    end-of-line             # End
bindkey "\e[4~" end-of-line
bindkey "\e[F"  end-of-line
bindkey '^D'    delete-char             # Del
bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode          # Insert
bindkey '^[[5~' history-search-backward # PgUp
bindkey '^[[6~' history-search-forward  # PgDn

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

source ~/git/config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
