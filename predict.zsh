# Fish-like fast/unobtrusive autosuggestions
#
#     https://github.com/tarruda/zsh-autosuggestions
#
# Install using:
#     git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/contrib/zsh-autosuggestions

SYNTAX=".zsh/contrib/zsh-autosuggestions/autosuggestions.zsh"
if [ -f $SYNTAX ]; then
    source $SYNTAX

    # Enable autosuggestions automatically.
    zle-line-init() {
        zle autosuggest-start
    }
    zle -N zle-line-init
fi
