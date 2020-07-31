# .bash_profile
# Created Thu 30 Jul 2020 03:54:05 PM AKDT
# Copyright (C) 2020 by Raymond E. Marcil <marcilr@gmail.com>
#
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

# Enable color output.  Required for configuration settings to work:
/usr/bin/git config --global color.ui true

# Set color for changed and untracked files:
/usr/bin/git config color.status.changed "blue normal bold"
/usr/bin/git config color.status.untracked "green normal bold"
