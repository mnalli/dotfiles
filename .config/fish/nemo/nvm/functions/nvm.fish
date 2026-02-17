function nvm
    # ensure that nvm is available but do not automatically switch to any version
    # useful when you want to control the version manually later
    # nvm interacts with the environment, so it needs to be sourced
    bass source "~/.nvm/nvm.sh --no-use; nvm $argv"
end
