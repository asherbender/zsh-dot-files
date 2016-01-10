# Fish-like history search feature.
#
#     https://github.com/zsh-users/zsh-history-substring-search
#
# Install using:
#     git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/plugins/zsh-history-substring-search
#
# Note: this is 'preferred' over the native solution as it enables
#       syntax-highlighting (if enabled) on the history searches.
#
if [ -d $HISTORY_SUBSTRING_SEARCH ]; then
    source "${HISTORY_SUBSTRING_SEARCH}/zsh-history-substring-search.zsh"

    # Bind UP and DOWN arrow keys.
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down

    # Bind P and N for EMACS mode.
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down

    # Define how the queries should be highlighted inside a matching
    # command.
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green,bold'

    # Define how the queries should be highlighted when no commands in the
    # history match it
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'

# Use native solution.
else
    # up-line-or-beginning-search, down-line-or-beginning-search These widgets
    #     are similar to the builtin functions up-line-or-search and
    #     down-line-or-search: if in a multiline buffer they move up or down
    #     within the buffer, otherwise they search for a history line matching
    #     the start of the current line. In this case, however, they search for
    #     a line which matches the current line up to the current cursor
    #     position, in the manner of history-beginning-search-backward and
    #     -forward, rather than the first word on the line.
    #
    #     man zshcontrib
    #
    autoload -Uz up-line-or-beginning-search
    autoload -Uz down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search

    # Bind UP and DOWN arrow keys.
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search

    # Bind P and N for EMACS mode
    bindkey -M emacs '^P' up-line-or-beginning-search
    bindkey -M emacs '^N' down-line-or-beginning-search
fi
