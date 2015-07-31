#------------------------------------------------------------------------------#
#                             Define Dependencies
#------------------------------------------------------------------------------#
typeset -A PACKAGES

PLUGINS="${HOME}/.zsh/plugins"

# Define local and remote location of syntax highlighting plugin.
SYNTAX_HIGHLIGHTING="${PLUGINS}/syntax-highlighting"
PACKAGES[$SYNTAX_HIGHLIGHTING]="https://github.com/zsh-users/zsh-syntax-highlighting"

# Define local and remote location of history substring search plugin.
HISTORY_SUBSTRING_SEARCH="${PLUGINS}/history-substring-search"
PACKAGES[$HISTORY_SUBSTRING_SEARCH]="https://github.com/zsh-users/zsh-history-substring-search"

# Define local and remote location of auto-suggestions plugin.
AUTOSUGGESTIONS="${PLUGINS}/autosuggestions"
PACKAGES[$AUTOSUGGESTIONS]="https://github.com/tarruda/zsh-autosuggestions"

# If the plugin directories do not exist, clone the repositories. Note that:
#
#     - package-management only ensures the plugin source-code exists. The
#       plugins must be loaded manually. This is done in the following section.
#
#     - packages have to be updated manually by calling 'zsh-update'.
#
source ~/.zsh/package-management.zsh

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

# Load aliases.
source ~/.zsh/alias.zsh

# General options.
setopt extendedglob
unsetopt autocd beep
