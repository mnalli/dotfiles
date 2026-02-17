function nvm_find_nvmrc
    # look for .nvmrc in upper directories
    bass source "~/.nvm/nvm.sh --no-use; nvm_find_nvmrc"
end
