# Note on completions: rather than defining all completions for aliases, expand
# the alias and perform the completion

alias ls='ls --color=always -CF'
alias la='ls -A'
alias lh='ls -d .[a-zA-Z0-9_]*'

# ll is eza
alias ll='eza -l -g --icons --color=always'
alias lla='ll -a'
alias llt='ll --tree --level=2'
alias llh='ll -d .[a-zA-Z0-9_]*'

alias grep='grep -i'

alias fd=fdfind

# bat dwim (auto pager). Line numbers are handled by the pager.
# This is because, if we want to copy some lines, we can disable line numbers.
alias b='batcat --decorations=never'
# bat cat
alias bat='b --color=always --paging=never'
# bat pager
alias bp='b --paging=always'

# interactive mode
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

alias tree='tree -C -L 2 --gitignore --prune -F -a'

alias o=open

alias g=git

alias c='git-cola & disown'
alias co='git-cola open & disown'

alias d=docker
alias dc='docker compose'

alias k=kubectl

alias l='less -F'

# copy stdin to clipboard
alias x='xsel -ib'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias j="jobs -l"

alias pu="pushd"
alias po="popd"

# alias ss="ps -aux"
# alias news="xterm -g 80x45 -e trn -e -S1 -N &"

alias j="jobs"


# Some useful aliases.
# alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
# alias clean='echo -n "Really clean this directory?";
# 	read yorn;
# 	if test "$yorn" = "y"; then
# 	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
# 	   echo "Cleaned.";
# 	else
# 	   echo "Not cleaned.";
# 	fi'


# inspired by /etc/profile.d/grc.sh
#
# contains code for interactive shells: functions and aliases are not inherited,
# so having them sourced by /etc/profile is pointless
#
# we do not use grc -es, I don't want to colour stderr

if [ -n "$(which grc)" ]; then

    # see /etc/grc.conf

    # always colour, even when piping into less or grep
    always_coloured=(
        # utils
        head tail ps diff stat id env
        # sysadmin
        blkid df du free fdisk findmnt lsof lsblk lspci mount w who last uptime
        lsmod lsattr tune2fs sysctl sensors
        # network
        ip ifconfig tcpdump
        ping ping6
        traceroute traceroute6 tracepath
        netstat ss nmap
        dig whois
        iptables
        # dev
        make gcc g++ ld
    )

    # do not colour when piping to other programs (problems with autocompletion)
    auto_coloured=(docker kubectl)

    # unused
    # as ls journalctl mtr semanage getsebool sockstat

    # define aliases

    for ex in "${always_coloured[@]}"
    do
        alias $ex="grc --colour=on $ex"
    done

    # define aliases
    for ex in "${auto_coloured[@]}"
    do
        alias $ex="grc $ex"
    done

fi

