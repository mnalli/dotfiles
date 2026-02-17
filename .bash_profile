# ~/.bash_profile

# ~/.profile is executed by the command interpreter for login shells.
# It is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# source .bashrc
. "$HOME/.bashrc"

# set PATH so it includes user's private bin
PATH="$HOME/.local/bin:$PATH"
