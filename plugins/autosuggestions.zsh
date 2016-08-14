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
    source "${AUTOSUGGESTIONS}/zsh-autosuggestions.zsh"

    # Customise autosuggest syntax highlighting.
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,underline'

    # Allow suggestions to be accepted mid-line.
    bindkey '^J' autosuggest-execute
fi
