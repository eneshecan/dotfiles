#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -lah'

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# powerline-shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

# Configure less as our pager
# Setting "less" as default pager and replacing all other pagers with it
export PAGER=less
alias more=${PAGER}
alias zless=${PAGER}
if [[ "${TERM}" != "dumb" ]]
then
    # Colorize the output to make manpages more readable
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
fi
export LESSCHARSET='utf-8'
# Tweak other "less" parameters
#  * Ignore case in searches
#  * Suppress line numbers
#  * Highlight new line after movement
#  * Set scrolling window size to window size -4 lines
#  * Allow color interpretation in source, but display all other control characters in caret notation
#  * Set a very long prompt together with its format string
export LESS='-i -n -w -z-4 -R -X -F -M -PM%t?f%f :Standard Input .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...?m (Input %i of %m).'
# Make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe.sh ]] && eval "$(SHELL=/bin/sh lesspipe.sh)"


# dotfiles config
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
complete -F _complete_alias config
