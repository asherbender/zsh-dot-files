#------------------------------------------------------------------------------#
#                                   Variables
#------------------------------------------------------------------------------#

# The file to save the history in when an interactive shell exits. If unset, the
# history is not saved.
#
#     http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTFILE
#
HISTFILE=~/.zsh_history

# The maximum number of events stored in the internal history list. If you use
# the HIST_EXPIRE_DUPS_FIRST option, setting this value larger than the SAVEHIST
# size will give you the difference as a cushion for saving duplicated history
# events.
#
#     http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTSIZE
#
HISTSIZE=10000

# The maximum number of history events to save in the history file.
#
#     http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-SAVEHIST
#
SAVEHIST=10000

#------------------------------------------------------------------------------#
#                                   Options
#------------------------------------------------------------------------------#

# This option both imports new commands from the history file, and also causes
# your typed commands to be appended to the history file (the latter is like
# specifying INC_APPEND_HISTORY, which should be turned off if this option is in
# effect). The history lines are also output with timestamps ala
# EXTENDED_HISTORY (which makes it easier to find the spot where we left off
# reading the file after it gets re-written).
#
# By default, history movement commands visit the imported lines as well as the
# local lines, but you can toggle this on and off with the set-local-history zle
# binding. It is also possible to create a zle widget that will make some
# commands ignore imported commands, and some include them.
#
# If you find that you want more control over when commands get imported, you
# may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY or
# INC_APPEND_HISTORY_TIME (see above) on, and then manually import commands
# whenever you need them using 'fc -RI'.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-SHAREHISTORY
#
setopt SHARE_HISTORY

# Save each command's beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file. The format of this prefixed data
# is:
#
#     ': <beginning time>:<elapsed seconds>;<command>'.
#
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-EXTENDEDHISTORY
#
unsetopt EXTENDED_HISTORY

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-HISTIGNOREDUPS
#
setopt HIST_IGNORE_DUPS

# If the internal history needs to be trimmed to add the current command line,
# setting this option will cause the oldest history event that has a duplicate
# to be lost before losing a unique event from the list. You should be sure to
# set the value of HISTSIZE to a larger number than SAVEHIST in order to give
# you some room for the duplicated events, otherwise this option will behave
# just like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-HISTEXPIREDUPSFIRST
#
setopt HIST_EXPIRE_DUPS_FIRST

# When writing out the history file, by default zsh uses ad-hoc file locking to
# avoid known problems with locking on some operating systems. With this option
# locking is done by means of the system's fcntl call, where this method is
# available. On recent operating systems this may provide better performance, in
# particular avoiding history corruption when files are stored on NFS.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-HISTFCNTLLOCK
#
setopt HIST_FCNTL_LOCK

# Remove superfluous blanks from each command line being added to the history
# list.
#
#    http://zsh.sourceforge.net/Doc/Release/Options.html#index-HISTREDUCEBLANKS
#
setopt HIST_REDUCE_BLANKS

# Whenever the user enters a line with history expansion, don't execute the line
# directly; instead, perform history expansion and reload the line into the
# editing buffer.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-HISTVERIFY
#
setopt HIST_VERIFY
