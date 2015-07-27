# Selects keymap 'emacs' for any operations by the current command, and also
# links 'emacs' to 'main' so that it is selected by default the next time the
# editor starts.
#
#     http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
#
# View the keymap using:
#
#     bindkey -M emacs
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

# Enable HOME/END keys.
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
