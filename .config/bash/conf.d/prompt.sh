
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
