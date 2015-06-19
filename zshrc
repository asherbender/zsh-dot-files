# Load history settings.
source ~/.zsh/history.zsh

# Load key bindings.
source ~/.zsh/bindkey.zsh

# Load completion settings.
source ~/.zsh/completion.zsh

# Allow colours in the terminal.
source ~/.zsh/colour.zsh

# Customise the prompt.
source ~/.zsh/prompt.zsh

# Directory stack settings.
source ~/.zsh/pushd.zsh

# Load autojump.
source ~/.zsh/autojump.zsh

# Fish shell like syntax highlighting.
source ~/.zsh/syntax-highlighting.zsh

# Load autopredict settings.
#
# Note: autopredict interacts poorly with up/down-line-or-beginning-search and
#       complicates <TAB> complete. For now it has been disabled.
#
# source ~/.zsh/predict.zsh

# General options.
setopt extendedglob
unsetopt autocd beep
