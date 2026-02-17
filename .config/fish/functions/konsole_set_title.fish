function konsole_set_title -d "Set Konsole tab (and window) title"
    echo -ne "\033]30;"
    echo -ne $argv
    echo -ne "\007"
end
