# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
#
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes /usr/local/go/bin if it exists
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi


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

# Add github ssh key for access to github
/usr/bin/ssh-add /home/marcilr/.ssh/github_rsa
