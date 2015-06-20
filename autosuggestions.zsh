# Fish-like fast/unobtrusive autosuggestions.
#
#     https://github.com/tarruda/zsh-autosuggestions
#
# Install using:
#     git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
#
# Notes:
#    - <TAB> in 'predict-on' accepts the entire prediction <TAB> in
#    - 'autosuggestions' accepts the first unambiguous prediction (usually up to
#      the first directory separator). This behaviour is preferred as it offers
#      better integration with TAB-completion (word-oriented behaviour rather
#      than line-oriented behaviour).
#
if [ -d $AUTOSUGGESTIONS ]; then
    source "${AUTOSUGGESTIONS}/autosuggestions.zsh"

    # Enable autosuggestions automatically.
    zle-line-init() {
        zle autosuggest-start
    }
    zle -N zle-line-init

    # Customise autosuggest syntax highlighting.
    AUTOSUGGESTION_HIGHLIGHT_CURSOR=1
    AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=black,underline'

    # Allow suggestions to be accepted mid-line.
    bindkey '^J' autosuggest-execute-suggestion

    # Allow autosuggest to be toggled on/off (make function verbose so the
    # autosuggestion's state is known).
    verbose-autosuggest-toggle() {
	if [[ -n $ZLE_AUTOSUGGESTING ]]; then
	    autosuggest-pause
	    zle -A autosuggest-self-insert-orig self-insert
            # [[ -o zle ]] && zle -I
            # print "$fg[red]autosuggest OFF"
            zle -M "autosuggest OFF"
	else
	    autosuggest-resume
            # [[ -o zle ]] && zle -I
            # print "$fg[green]autosuggest ON"
            zle -M "autosuggest ON"
	fi
    }
    zle -N verbose-autosuggest-toggle
    bindkey '^Z' verbose-autosuggest-toggle
fi
