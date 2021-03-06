# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

export LESS=XR

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export GIT_SSL_NO_VERIFY=1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export TERM=xterm-256color
export PS1='\[\033[01;32m\]\u\[\033[00m\]\[\033[01;34m\]@\[\033[00m\]\[\033[01;32m\]\h\[\033[00m\] \[\033[01;34m\]`pwd -P`\[\033[00m\] % '

################################################################################
# enable color support of ls and also add handy aliases
################################################################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ftp="/bin/ftp -p -i"

################################################################################
# If this is an xterm set the title to user@host:dir
################################################################################
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

ADDITIONAL_SOURCES="bash_aliases bash_functions"

for source in $ADDITIONAL_SOURCES; do
   if [ -f ~/.$source ]; then
       . ~/.$source
   fi
done

if [ -e $HOME/.bash_local ]; then
   for source in $HOME/.bash_local/*; do
      . $source
   done
fi

ulimit -c unlimited

export PATH=\
:$HOME/bin\
:$HOME/.local/bin\
:/bin\
:/usr/sbin\
:/usr/bin\
:/usr/local/sbin\
:/usr/local/bin\
