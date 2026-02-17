# https://fishshell.com/docs/current/prompt.html

# This file is in conf.d/ because it is loaded all the times
# If it was in functions/ it would be overwritten if we set another theme

# Disable automatic prompt decoration by venv/bin/activate.fish
# By integrating the venv info into our prompt, it will show up in subshells as well
# - The prompt is generated from the inherited environment
# - Useful if we launch an editor from the shell, that may launch another shell
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt

    set_color yellow
    printf '%s' $USER

    set_color normal
    printf ' at '

    set_color magenta
    echo -n (prompt_hostname)

    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)

    set_color normal

    # get git branch, if it exist
    set -l git_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if test $status -eq 0
        set_color brblue
        printf ' 🐙 %s' $git_branch

        set_color normal
        echo -n ' | '

        # HEAD hash
        set_color cyan
        printf '%s' (git log -n 1 --pretty=tformat:"%h")
    end

    echo    # new line

    # current venv
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end

    printf '↪ '

    set_color normal
end

# function fish_right_prompt
# end


# conda defines this function

# # Defined via `source`
# function fish_right_prompt
#     if not set -q CONDA_LEFT_PROMPT
#         __conda_add_prompt
#     end
#     __fish_right_prompt_orig
# end

# TODO: view fish_*_prompt variables
