# Fish shell like syntax highlighting.
#
#     see https://github.com/zsh-users/zsh-syntax-highlighting
#
# Install using:
#     git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/contrib/zsh-syntax-highlighting

SYNTAX=".zsh/contrib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f $SYNTAX ]; then
    source $SYNTAX

    # Tone down colours.
    #
    #     see https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/highlighters/main
    #
    ZSH_HIGHLIGHT_STYLES[alias]=none                           # Aliases
    ZSH_HIGHLIGHT_STYLES[assign]=none                          # Variable assignments
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=none     # Back double quoted arguments
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none            # Backquoted expressions
    ZSH_HIGHLIGHT_STYLES[builtin]=none                         # Shell builtin commands
    ZSH_HIGHLIGHT_STYLES[command]=none                         # Commands
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none                # Command separation tokens
    ZSH_HIGHLIGHT_STYLES[default]=none                         # Parts of the buffer that do not match anything
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=none   # Dollar double quoted arguments
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none            # Double hyphen options
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=none          # Double quoted arguments
    ZSH_HIGHLIGHT_STYLES[function]=none                        # Functions
    ZSH_HIGHLIGHT_STYLES[globbing]=none                        # Globbing expressions
    ZSH_HIGHLIGHT_STYLES[hashed-command]=none                  # Hashed commands
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue}           # History expansion expressions
    ZSH_HIGHLIGHT_STYLES[path]=none                            # Paths
    ZSH_HIGHLIGHT_STYLES[path_approx]=none                     # Approximated paths
    ZSH_HIGHLIGHT_STYLES[path_prefix]=none                     # Path prefixes
    ZSH_HIGHLIGHT_STYLES[precommand]=none                      # Precommands (i.e. exec, builtin, ...)
    ZSH_HIGHLIGHT_STYLES[reserved-word]=none                   # Shell reserved words
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none            # Single hyphen options
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=none          # Single quoted arguments
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold            # Unknown tokens / errors

fi