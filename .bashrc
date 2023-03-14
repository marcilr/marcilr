# .bashrc
# Created Thu 08 Nov 2019 11:29:41 AM AKST
# by Raymond E. Marcil <marcilr@gmail.com>
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
#
# Links
# =====
# Difference Between .bashrc, .bash-profile, and .profile
# Last modified: February 28, 2021
# by baeldung
# https://www.baeldung.com/linux/bashrc-vs-bash-profile-vs-profile
#
# Go environment variables
# https://pkg.go.dev/cmd/go#hdr-GOPATH_environment_variable
#

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#
# enable color support of ls and also add handy aliases
# -p to add trailing slash to directories
#
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -p --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#
# Set GOROOT and GOPATH
#
# "GOPATH is a variable that defines the root of your workspace.
# By default, the workspace directory is a directory that is
# named go within your user home directory (~/go for Linux and
# MacOS, %USERPROFILE%/go for Windows). GOPATH stores your code
# base and all the files that are necessary for your development.
# You can use another directory as your workspace by configuring
# GOPATH for different scopes. GOPATH is the root of your
# workspace and contains the following folders:
#
# src/: location of Go source code (for example, .go, .c, .g, .s).
# pkg/: location of compiled package code (for example, .a).
# bin/: location of compiled executable programs built by Go."
# --GOROOT and GOPATH
# Last modified: 12 December 2022
# GoLand 2022.3
# https://www.jetbrains.com/help/go/configuring-goroot-and-gopath.html
# Added Sun 29 Jan 2023 11:27:26 AM AKST
#
if [ -d "/usr/local/go" ] ; then
    GOROOT=/usr/local/go
fi

#
# Set GOPATH
# "$GOPATH is called as the workspace directory for Go programs.
# Go source-code, belongs to you and to others lives here.
# So, when you import a package, Go searches that package inside
# this directory’s src directory."
# --Fix your $GOPATH and $GOROOT
# Inanc Gumus, Sep 27, 2017, 2 min read
# https://blog.learngoprogramming.com/what-are-goroot-and-gopath-1231b084723f
#
if [ -d "${HOME}/go" ] ; then
    GOPATH=${HOME}/go
fi

#
# Set GOROOT
# Installation directory for go.
$
if [ -d "/usr/local/go" ] ; then
    GOROOT=/usr/local/go
fi

# Add /usr/local/go/bin to PATH
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi

# Add /home/marcilr/go/bin to PATH
if [ -d "/home/marcilr/go/bin" ] ; then
    PATH="/home/marcilr/go/bin:$PATH"
fi




# Set default browser, used by evince
BROWSER=/usr/bin/google-chrome

#
# Colorize git status output for filenames
#
# Was having a real hard time read untracked filenames,
# that were red on black, in 'git status' output.
#
# Setting colors in ~/.gitconfig or ~/.git/config
# had no affect.
#
# Links
# =====
# [SOLVED] How to Color Git using Ubuntu Terminal?
# https://www.zyxware.com/articles/5736/solved-how-to-color-git-using-ubuntu-terminal
#
/usr/bin/git config --global color.ui true
/usr/bin/git config color.status.changed "blue normal bold"
/usr/bin/git config color.status.untracked "green normal bold"
