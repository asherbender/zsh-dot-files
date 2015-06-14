# Change the current directory, and push the old current directory onto the
# directory stack. In the first form, change the current directory to arg. If
# arg is not specified, change to the second directory on the stack (that is,
# exchange the top two entries), or change to $HOME if the PUSHD_TO_HOME option
# is set or if there is only one entry on the stack. Otherwise, arg is
# interpreted as it would be by cd. The meaning of old and new in the second
# form is also the same as for cd.
#
#     http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-pushd
#
# Remove an entry from the directory stack, and perform a cd to the new top
# directory. With no argument, the current top entry is removed. An argument of
# the form '+n' identifies a stack entry by counting from the left of the list
# shown by the dirs command, starting with zero. An argument of the form -n
# counts from the right. If the PUSHD_MINUS option is set, the meanings of '+'
# and '-' in this context are swapped.
#
#     http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-popd


# Make cd push the old directory onto the directory stack.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTOPUSHD
#
setopt AUTO_PUSHD

# Don't push multiple copies of the same directory onto the directory stack.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-PUSHDIGNOREDUPS
#
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-PUSHDSILENT
#
setopt PUSHD_SILENT
