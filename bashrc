# Usage tips:
# https://www.gnu.org/software/bash/manual/html_node/Commands-For-History.html
# http://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/x1712.htm

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

color_prompt=yes

if [ "$color_prompt" = yes ]; then
    case $HOSTNAME in
        zach-dev )      PS1='\[\033[01m\]\$ ' ;;
        zach-lt )       PS1='\[\033[01m\]\$ ' ;;
        zach-windows )  PS1='\[\033[01m\]\$ ' ;;
        zangold-dev )   PS1='\[\033[01m\]\$ ' ;;
        zangold-test )  PS1='\[\033[01;32m\]\$ ' ;;
        zangold-test2 ) PS1='\[\033[01;31m\]\$ ' ;;
    esac
    trap 'echo -ne "\e[0m"' DEBUG
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias search='grep -Irn --exclude-dir=".*" --exclude-dir="_out" --exclude="tags" --exclude="types_c.taghl" --exclude="cpptags" --exclude="cscope.*"'
alias csearch='grep -Irn --exclude-dir=".*" --exclude-dir="_out" --exclude="tags" --exclude="cpptags" --exclude="cscope.*" --exclude="*.xml"'
alias cs='grep -Irn --exclude-dir=".*" --exclude-dir="_out" --exclude="tags" --exclude="cpptags" --exclude="cscope.*" --exclude="*.xml"'

export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
export PATH=/usr/lib/ccache/bin:$PATH

export EDITOR=nvim

export LLVM_PROFILE_FILE=~/.default.profraw

alias nvbuild-unsafe='nvbuild NV_CHECK_AUTOGEN_SOURCE=0'
alias lock='gnome-screensaver-command -l'
alias v='nvim -p'
alias xcp='cat | xsel -b'
alias wi='find -name'

alias suspend='systemctl suspend'
alias vim='nvim -p'

# For the GNU screen status bar
#if [[ "$TERM" == *"screen"* ]]; then
#    export PROMPT_COMMAND='echo -ne "\033_[`hostname | sed -e "s/zach-//"`]:`pwd | sed -e "s/\/home\/zach/~/"` [`git branch 2> /dev/null | grep "\*" | cut -d" " -f2 | sed -e "s/zja-//"`]\033\\"'
#else
#    export PROMPT_COMMAND=''
#fi

export DISPLAY=:0

export PM_PACKAGES_ROOT=$HOME/packman-repo

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

stty -ixon

# this probably makes some linux pros angry, but it makes my life easier
export TERM=xterm-256color
. "$HOME/.cargo/env"

source "/etc/profile.d/debuginfod.sh"
