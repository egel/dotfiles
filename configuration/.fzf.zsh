# Ignore some dir/files for fzf
# source: https://github.com/junegunn/fzf/issues/1625#issuecomment-507674106
#
# determines search program for fzf
#if type ag &> /dev/null; then
    #export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
#fi
# refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

# enable completion for everything
zstyle ':completion:*' fzf-search-display true

# only aws command completion
#zstyle ':completion:*:*:aws' fzf-search-display true
