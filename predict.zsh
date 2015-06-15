# This set of functions implements predictive typing using history search. After
# predict-on, typing characters causes the editor to look backward in the
# history for the first line beginning with what you have typed so far. After
# predict-off, editing returns to normal for the line found. In fact, you often
# don't even need to use predict-off, because if the line doesn't match
# something in the history, adding a key performs standard completion, and then
# inserts itself if no completions were found. However, editing in the middle of
# a line is liable to confuse prediction; see the toggle style below.
#
# With the function based completion system (which is needed for this), you
# should be able to type TAB at almost any point to advance the cursor to the
# next 'interesting' character position (usually the end of the current word,
# but sometimes somewhere in the middle of the word). And of course as soon as
# the entire line is what you want, you can accept with return, without needing
# to move the cursor to the end first.
#
#     see http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-predict_002don
#
autoload predict-on

zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^Z' predict-off

zstyle ':predict' verbose true
