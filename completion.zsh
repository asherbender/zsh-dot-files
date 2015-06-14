# Initialise completion system.
#
#     http://zsh.sourceforge.net/Doc/Release/Completion-System.html#index-compinit
#
zmodload zsh/complist
autoload -Uz compinit
compinit

#------------------------------------------------------------------------------#
#                                   Options
#------------------------------------------------------------------------------#

# Automatically list choices on an ambiguous completion.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTOLIST
#
setopt AUTO_LIST

# Automatically use menu completion after the second consecutive request for
# completion, for example by pressing the tab key repeatedly. This option is
# overridden by MENU_COMPLETE.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTOMENU
#
setopt AUTO_MENU

# If a completion is performed with the cursor within a word, and a full
# completion is inserted, the cursor is moved to the end of the word. That is,
# the cursor is moved to the end of the word if either a single match is
# inserted or menu completion is performed.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-ALWAYSTOEND
#
setopt ALWAYS_TO_END

# If unset, the cursor is set to the end of the word if completion is
# started. Otherwise it stays there and completion is done from both ends.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-COMPLETEINWORD
#
setopt COMPLETE_IN_WORD

# Perform a path search even on command names with slashes in them. Thus if
# '/usr/local/bin' is in the user's path, and he or she types 'X11/xinit', the
# command '/usr/local/bin/X11/xinit' will be executed (assuming it
# exists). Commands explicitly beginning with '/', './' or '../' are not subject
# to the path search. This also applies to the '.' and source builtins.
#
# Note that subdirectories of the current directory are always searched for
# executables specified in this form. This takes place before any search
# indicated by this option, and regardless of whether '.'  or the current
# directory appear in the command search path.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-PARODIES
#
setopt PATH_DIRS

# If a parameter is completed whose content is the name of a directory, then add
# a trailing slash instead of a space.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTOPARAMSLASH
#
setopt AUTO_PARAM_SLASH

# On an ambiguous completion, instead of listing possibilities or beeping,
# insert the first match immediately. Then when completion is requested again,
# remove the first match and insert the second match, etc. When there are no
# more matches, go back to the first one again. reverse-menu-complete may be
# used to loop through the list in the other direction. This option overrides
# AUTO_MENU.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-MENUCOMPLETE
#
unsetopt MENU_COMPLETE

# If this option is unset, output flow control via start/stop characters
# (usually assigned to ^S/^Q) is disabled in the shell's editor.
#
#     http://zsh.sourceforge.net/Doc/Release/Options.html#index-FLOWCONTROL
#
unsetopt FLOW_CONTROL

#------------------------------------------------------------------------------#
#                               Completion Style
#------------------------------------------------------------------------------#

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Fuzzy matching of completions (mistyped). Increase the number of errors based
# on the length of the typed word.
#
#     http://zshwiki.org/home/examples/compsys/matchers
#
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Ignore case during completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# # Environmental Variables
# zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# # Populate hostname completion.
# zstyle -e ':completion:*:hosts' hosts 'reply=(
# ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
# ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
# ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
# )'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Killall
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"'
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:*:killall:*' force-list always
zstyle ':completion:*:*:killall:*' single

# # Man
# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.(^1*)' insert-sections true
