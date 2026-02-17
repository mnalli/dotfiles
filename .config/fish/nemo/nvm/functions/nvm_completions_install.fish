function nvm_completions_install -d "Install nvm, completions for fish"
    # download completions from github repo
    set OUT_FILE ~/.config/fish/completions/nvm.fish
    curl -o $OUT_FILE https://raw.githubusercontent.com/FabioAntunes/fish-nvm/refs/heads/master/completions/nvm.fish
    source $OUT_FILE
end
