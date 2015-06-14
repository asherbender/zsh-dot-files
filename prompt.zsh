# If the PROMPT_SUBST option is set, the prompt string is first subjected to
# parameter expansion, command substitution and arithmetic expansion.
#
# %n  $USERNAME.
#
# %M  The full machine hostname.
#
# %~  As %d and %/, but if the current working directory starts with $HOME, that
#     part is replaced by a ‘~’. Furthermore, if it has a named directory as its
#     prefix, that part is replaced by a ‘~’ followed by the name of the
#     directory, but only if the result is shorter than the full path; Filename
#     Expansion.
#
#
#     http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html

# Replicate Debian GNU/Linux bash prompt.
PROMPT='%n@%M:%~$ '
