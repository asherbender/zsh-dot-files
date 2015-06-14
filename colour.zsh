# This function initializes several associative arrays to map color names to
# (and from) the ANSI standard eight-color terminal codes. These are used by the
# prompt theme system (Prompt Themes). You seldom should need to run colors more
# than once.
#
# The eight base colors are: black, red, green, yellow, blue, magenta, cyan, and
# white. Each of these has codes for foreground and background. In addition
# there are seven intensity attributes: bold, faint, standout, underline, blink,
# reverse, and conceal. Finally, there are seven codes used to negate
# attributes: none (reset all attributes to the defaults), normal (neither bold
# nor faint), no-standout, no-underline, no-blink, no-reverse, and no-conceal.
#
# Some terminals do not support all combinations of colors and intensities.
#
#     http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-colors
#
autoload -U colors && colors

# Enable color support for commands.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
