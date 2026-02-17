# This file is sourced after all files in conf.d
# This gives you the chanche of overriding plugins' configuration

# abbreviations
abbr -ag o open
abbr -ag c code
abbr -ag g git

abbr -ag d docker
abbr -ag dc docker compose
abbr -ag k kubectl


# kwallet integration using askpass (vscode ignores SSH_ASKPASS)
set -x GIT_ASKPASS ksshaskpass

# use git cola for rebase
set -x GIT_SEQUENCE_EDITOR git-cola-sequence-editor

set -x EDITOR zed --wait

# docker compose
set -x COMPOSE_REMOVE_ORPHANS true
set -x COMPOSE_PARALLEL_LIMIT 4         # max parallel engine calls


# aliases

alias fd fdfind
alias bat batcat

alias kset konsole_set_title

alias la "ls -A"

alias rm 'rm -I'
alias cp 'cp -i'
alias mv 'mv -i'

# eza
alias ll  "eza -l -g --icons"
alias lla "ll -a"
alias llt "ll --tree --level=2"


# theme
# set -g theme_nerd_fonts yes
# set -g theme_display_user yes

# # theme
# set -g theme_color_scheme terminal-dark
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_display_user yes
# set -g theme_hide_hostname no
# set -g theme_hostname always


function cd
    builtin cd $argv

    # Check for .nvmrc and activate NVM if it exists
    if test -f .nvmrc
        nvm use
    end

    # add other automatic activations
    # virtualenv?
    # direnv?
end

# run checks at shell start
cd .


# # fzf plugin config
# set fzf_preview_dir_cmd llt -a

# # use _fzf_wrapper to implement custom, interactive directory jumping
# function _fzf_change_directory
#     set fzf_arguments --prompt="Directory> " --preview="_fzf_preview_file {}" --multi --ansi
#     _fzf_wrapper $fzf_arguments | perl -pe 's/([ ()])/\\\\$1/g' | read foo

#     if [ $foo ]
#       cd $foo
#       commandline -r ''
#       commandline -f repaint
#     else
#       commandline ''
#     end
# end

# function fzf_change_directory
#     begin
#         # print interesting directories
#         echo ~/.config
#         ls -ad ~/Projects/*/*
#     # end | sed -e 's/\/$//' | awk '!a[$0]++' | _fzf_change_directory $argv
#     end | _fzf_change_directory $argv
# end

# history-pager

# bindings

# bind \cf "fzf_change_directory"
# bind \eb "fish_commandline_append '| bat'"
# bind \ex "fish_commandline_append '| xsel -ib'"
# bind \ej "fish_commandline_append '| jq .'"

# clear scrollback and redraw prompt
# without the terminal will only scroll back
# bind \cl "clear; fish_prompt"

# clear-screen: CTRL - l 

# ALT - p: __fish_paginate


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f /home/michele/miniconda3/bin/conda
#     eval /home/michele/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/home/michele/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/home/michele/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/home/michele/miniconda3/bin" $PATH
#     end
# end
# # <<< conda initialize <<<


set -g MSM_PREVIEW batcat --decorations=never --color=always -l fish
set -g MSM_STORE $__fish_user_data_dir/snippets.fish

bind \ec msm_capture
bind \er msm_recall
