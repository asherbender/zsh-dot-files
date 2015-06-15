# Selects keymap 'emacs' for any operations by the current command, and also
# links 'emacs' to 'main' so that it is selected by default the next time the
# editor starts.
#
#     http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
#
bindkey -e

# If you are looking for functions to implement moving over and editing words in
# the manner of bash, where only alphanumeric characters are considered word
# characters, you can use the functions described in the next section. The
# following is sufficient:
#
#     http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#ZLE-Functions
#
autoload -U select-word-style
select-word-style bash

# up-line-or-beginning-search, down-line-or-beginning-search
#     These widgets are similar to the builtin functions up-line-or-search and
#     down-line-or-search: if in a multiline buffer they move up or down within
#     the buffer, otherwise they search for a history line matching the start of
#     the current line. In this case, however, they search for a line which
#     matches the current line up to the current cursor position, in the manner
#     of history-beginning-search-backward and -forward, rather than the first
#     word on the line.
#
#     man zshcontrib
#
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
