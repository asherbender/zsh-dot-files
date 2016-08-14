#------------------------------------------------------------------------------#
#                             Define Dependencies
#------------------------------------------------------------------------------#
typeset -A PACKAGES

PLUGINS="${HOME}/.zsh/plugins"

# Define local and remote location of auto-suggestions plugin.
AUTOSUGGESTIONS="${PLUGINS}/autosuggestions"
PACKAGES[$AUTOSUGGESTIONS]="https://github.com/tarruda/zsh-autosuggestions"

# Define local and remote location of history substring search plugin.
HISTORY_SUBSTRING_SEARCH="${PLUGINS}/history-substring-search"
PACKAGES[$HISTORY_SUBSTRING_SEARCH]="https://github.com/zsh-users/zsh-history-substring-search"

# Define local and remote location of syntax highlighting plugin.
SYNTAX_HIGHLIGHTING="${PLUGINS}/syntax-highlighting"
PACKAGES[$SYNTAX_HIGHLIGHTING]="https://github.com/zsh-users/zsh-syntax-highlighting"

# If the plugin directories do not exist, clone the repositories. Note that:
#
#     - package-management only ensures the plugin source-code exists. The
#       plugins must be loaded manually. This is done in the following section.
#
#     - packages have to be updated manually by calling 'zsh-update'.
#
source ${PLUGINS}/package-management.zsh

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

# Load aliases.
source ~/.zsh/alias.zsh

# General options.
setopt extendedglob
unsetopt autocd beep

#------------------------------------------------------------------------------#
#                          Load and Configure Plugins
#------------------------------------------------------------------------------#

# Load autojump.
source ${PLUGINS}/autojump.zsh

# Load history-search.
source ${PLUGINS}/history-substring-search.zsh

# Load autopredict settings.
#
# Note: autopredict interacts poorly with up/down-line-or-beginning-search. It
#       will operate well with the 'zsh-history-substring-search' module. If
#       enabled it adds complexity to <TAB> completions.
#
source ${PLUGINS}/autosuggestions.zsh

# Fish shell like syntax highlighting.
#
# Note: zsh-syntax-highlighting.zsh wraps ZLE widgets. It must be sourced after
#       all custom widgets have been created (i.e., after all zle -N calls and
#       after running compinit). Widgets created later will work, but will not
#       update the syntax highlighting.
#
source ${PLUGINS}/syntax-highlighting.zsh

#------------------------------------------------------------------------------#
#                              Local history search
#------------------------------------------------------------------------------#
#
# The SHARE_HISTORY option both imports new commands from the history file, and
# also causes your typed commands to be appended to the history file. By
# default, history movement commands visit the imported lines as well as the
# local lines, but you can toggle this on and off with the set-local-history zle
# binding. It is also possible to create a zle widget that will make some
# commands ignore imported commands, and some include them.
#
# To allow terminals to share commands/history but preference local history,
# configure the up/down keys to search the local history. Allow the global
# history to be searched via the CTRL modifier.

bindkey "${key[Up]}" up-line-or-local-history
bindkey "${key[Down]}" down-line-or-local-history

up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history

down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history

bindkey "^[[1;5A" up-line-or-history    # [CTRL] + Cursor up
bindkey "^[[1;5B" down-line-or-history  # [CTRL] + Cursor down
