#------------------------------------------------------------------------------#
#                                 Load Plugins
#------------------------------------------------------------------------------#

# Load zgen. If not installed:
#
#     git clone https://github.com/tarjoilija/zgen ~/.zsh/plugins/zgen
#
ZGEN_DIR="${HOME}/.zsh/plugins/zgen"
source "${HOME}/.zsh/plugins/zgen/zgen.zsh"

# Check for init script.
if ! zgen saved; then
    echo "Creating a zgen save"

    # Plugins.
    zgen load https://github.com/zsh-users/zsh-syntax-highlighting
    zgen load https://github.com/zsh-users/zsh-history-substring-search
    zgen load https://github.com/tarruda/zsh-autosuggestions

    # Save all to init script.
    zgen save
fi

#------------------------------------------------------------------------------#
#                               Load Customisation
#------------------------------------------------------------------------------#

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
source ~/.zsh/history-substring-search.zsh

# Load autopredict settings.
#
# Note: autopredict interacts poorly with up/down-line-or-beginning-search. It
#       will operate well with the 'zsh-history-substring-search' module. If
#       enabled it adds complexity to <TAB> completions.
#
source ~/.zsh/autosuggestions.zsh


# General options.
setopt extendedglob
unsetopt autocd beep
