
# Conveniences for relative navigation.
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# List all directory contents
#
#     -l     use a long listing format
#     -a, --all
#            do not ignore entries starting with .
#     -h, --human-readable
#            with -l and/or -s, print human readable sizes (e.g., 1K 234M 2G)
alias ll='ls -lah'

# Show all refs (branches, tags, etc.) in the Git repository browser.
alias gitk='gitk --all'
