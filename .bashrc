# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# disable the XON/XOFF feature (enable forward i-search)
stty -ixon

HISTCONTROL=ignorespace:erasedups
HISTIGNORE="&:bg:fg:id:ls:ll:pwd"

# append to the history file, don't overwrite it
shopt -s histappend

# append history after every command
PROMPT_COMMAND='history -a'

HISTSIZE=-1
# HISTFILE=~/.bash_history

# multiline-capable history format
HISTTIMEFORMAT='%F %T '

# save all lines of a multiple-line command in the same history entry
shopt -s cmdhist lithist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# prevent overwrite when redirecting (force with '>|')
set -o noclobber

# cd without cd
shopt -s autocd


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


################################### prompt #####################################

_yellow=$(tput setaf 3)
_magenta=$(tput setaf 5)
_green=$(tput setaf 2)
_cyan=$(tput setaf 6)
_blue=$(tput setaf 4)

# _bold=$(tput bold)

_reset=$(tput sgr0)

_git_prompt () {
    local branch hash

    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    hash=$(git log -n 1 --pretty=tformat:"%h" 2>/dev/null)

    [ -n "$branch" ] && echo "🐙 ${_blue}$branch${_reset} | ${_cyan}$hash${_reset}"
}

PS1='${_yellow}\u${_reset} at ${_magenta}\h${_reset} in ${_green}\w${_reset} $(_git_prompt)
\$ '

################################# completions ##################################

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

complete -C /snap/aws-cli/current/bin/aws_completer aws

eval "$(kubectl completion bash)"

################################################################################


# _fzf_complete () {
#     # echo $READLINE_ARGUMENT \"$READLINE_LINE\" $READLINE_MARK $READLINE_POINT

#     local region="${READLINE_LINE:0:READLINE_POINT}"
#     local after="${READLINE_LINE:READLINE_POINT:${#READLINE_LINE}}"

#     echo "region: '$region'"
#     echo "after: '$after'"

#     local base="${region% *} "
#     local curr="${region##* }"

#     echo "base: '$base'"
#     echo "curr: '$curr'"

#     # '\e?' prints possible completions at point
#     local options=$(echo -en "bind 'set completion-query-items 0'
#       bind 'set colored-completion-prefix off'
#       bind 'set colored-stats off'
#       $region\e?\x15" | bash -i 2>&1 | sed '1,8d' | head -n -2)
#     local selected=$(echo $options | xargs -n1 echo -e | fzf --query "$curr" --height 50% --reverse)

#     if [[ -z "$selected" ]]; then
#       return
#     fi

#     echo "base: '$base'"
#     echo "selected: '$selected'"
#     echo "after: '$after'"

#     # change command line
#     local region="$base$selected"
#     READLINE_LINE="$region$after"
#     READLINE_POINT=${#region}
# }

# bind -x '"\e\t": "_fzf_complete"'


# TODO: keybinding?
bind -x '"\C-xw": "which ${READLINE_LINE%% *}"'

ktitle () {
    echo -ne "\033]30;$@\007"
    # xtitle: echo -n -e "\033]0;$*\007"
}

laws () {
    local port=$1

    [ -z "$port" ] && port=4566

    if [ -z $AWS_ENDPOINT_URL ]; then
        export AWS_ENDPOINT_URL="http://localhost:$port"
        echo export AWS_ENDPOINT_URL="http://localhost:$port"
    else
        unset AWS_ENDPOINT_URL
        echo unset AWS_ENDPOINT_URL
    fi
}

_toggle_sudo () {
    first_token=${READLINE_LINE%% *}

    if [[ $first_token == 'sudo' ]]; then
        READLINE_LINE="${READLINE_LINE#* }"
    else
        READLINE_LINE="sudo $READLINE_LINE"
    fi

    READLINE_POINT=${#READLINE_LINE}
}

bind -x '"\es": "_toggle_sudo"'

_insert_command_substitution () {
    local new_line="${READLINE_LINE:0:READLINE_POINT}\$() ${READLINE_LINE:READLINE_POINT}"

    READLINE_LINE="$new_line"
    ((READLINE_POINT+=2))
}

# TODO: keybinding?
# bind -x '"\ec": "_insert_command_substitution"'

_run+page_dwim () {
    # set -f  # no double expand
    $READLINE_LINE | less -F
    # return ${PIPESTATUS[0]}  # real rc
}

# TODO: keybinding?
bind -x '"\el": "_run+page_dwim"'


################################## ENV VARS ####################################

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# read colors by default, ignore case in all searches
export LESS='RiSM --use-color'
export PAGER=less    # bat will use less (with arguments)

# systemctl and journalctl less options
export SYSTEMD_LESS="X $LESS"       # TODO: problem with bat and systemctl

# kwallet integration using askpass (vscode ignores SSH_ASKPASS)
export GIT_ASKPASS=ksshaskpass

# TODO: remove?
export EDITOR='zed --wait'

# docker compose
export COMPOSE_REMOVE_ORPHANS=true
export COMPOSE_PARALLEL_LIMIT=4         # max parallel engine calls

################################################################################

NVM_DIR=~/.config/bash/nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

#################################### fzf #######################################

# inspired by: github.com/craftzdog/dotfiles-public

fzf_preview_dir_cmd='tree -C -L 2 --gitignore --prune -F -a'

if [ -n "$(which eza)" ]; then
    fzf_preview_dir_cmd='eza --icons --color=always --tree --level=2 -a'
fi

# TODO: name it select project?
_fzf_select_directory() {
    selection=$(
        {
            # print interesting directories
            echo ~/.config

            # bypass alias
            \ls -ad --color=always ~/Projects/*/*

            # find $(ghq root) -maxdepth 4 -type d -name .git | sed 's/\/\.git//'
            # ls -ad */|perl -pe "s#^#$PWD/#"|grep -v \.git
            # ls -ad $HOME/Developments/*/* |grep -v \.git

        # TODO: cosa fa awk?
        } | awk '!a[$0]++' | fzf \
            --multi --ansi \
            --prompt='Directory> '  \
            --preview="$fzf_preview_dir_cmd {}"   \
            --preview-label=PREVIEW
    )

    if [ -n "$selection" ]; then
        local new_line="${READLINE_LINE:0:READLINE_POINT}'$selection' ${READLINE_LINE:READLINE_POINT}"

        READLINE_LINE="$new_line"
        ((READLINE_POINT+=${#selection}+2))    # len + quotes ('')
    fi

}

# TODO: check binding
bind -x '"\C-f": "_fzf_select_directory"'

fzf_preview_file_cmd='batcat --color=always --line-range=:500'      # first 500 lines

# TODO: ha senso che listi tutta la sottodirectory
_fzf_select_file() {
    selection=$(
        fzf --multi --ansi \
            --prompt='File> '  \
            --preview="$fzf_preview_file_cmd {}"
    )

    if [ -n "$selection" ]; then
        local new_line="${READLINE_LINE:0:READLINE_POINT}'$selection' ${READLINE_LINE:READLINE_POINT}"

        READLINE_LINE="$new_line"
        ((READLINE_POINT+=${#selection}+2))    # len + quotes ('')
    fi
}

# TODO: check binding
# bind -x '"\C-f": "_fzf_select_file"'

h() {
    $@ -h | bat -l help
}


. ~/.config/bash/insert_newline.bash/insert_newline.bash


MSM_PREVIEW='batcat --decorations=never --color=always --paging=never -l bash'
MSM_STORE=(~/.local/share/bash/*)

MSM_FZF_PREVIEW_WINDOW='down:3'

. ~/.config/bash/msm/msm.bash

bind -x '"\ec": msm_capture'
bind -x '"\er": msm_recall'

. ~/.config/bash/fzf_complete.bash/fzf_complete.bash
