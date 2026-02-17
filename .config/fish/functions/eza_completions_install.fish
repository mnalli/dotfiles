function eza_completions_install -d "Install eza completions for fish"
    # download completions from github repo (fish completions are not included in the debian package)
    set OUT_FILE ~/.config/fish/completions/eza.fish
    curl -o $OUT_FILE https://raw.githubusercontent.com/eza-community/eza/refs/heads/main/completions/fish/eza.fish
    source $OUT_FILE
end
