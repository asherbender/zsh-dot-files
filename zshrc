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

# Directory stack settings (less useful with autojump enabled).
source ~/.zsh/pushd.zsh

# Load autojump.
source ~/.zsh/autojump.zsh

# Fish shell like syntax highlighting.
source ~/.zsh/syntax-highlighting.zsh

# Load history-search.
source ~/.zsh/history-search.zsh

# Load autopredict settings.
#
# Note: autopredict interacts poorly with up/down-line-or-beginning-search. It
#       will operate well with the 'zsh-history-substring-search' module. If
#       enabled it adds complexity to <TAB> completions.
#
source ~/.zsh/predict.zsh


# General options.
setopt extendedglob
unsetopt autocd beep
