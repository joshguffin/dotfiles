# vim: set ft=sh:

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias vi=gvim

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias ipython2=/opt/python-2.7.13/bin/ipython
alias ipython3=/opt/python-3.6.2/bin/ipython

function fnd
{
   grep -H --color=auto -d recurse "$@" .
}

function fndj
{
   grep -H --color=auto --include "*.java" -d recurse "$@" .
}

function fndjs
{
   grep -H --color=auto --include "*.js" -d recurse "$@" .
}

function fndp
{
   grep -H --color=auto --include "*.py" -d recurse "$@" .
}

