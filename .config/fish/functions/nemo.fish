
function nemo -d "Nemo plugin manager" -a subcommand

    # remove subcommand from argv
    set argv $argv[2..]

    pushd $nemo_path

    switch $subcommand
        case add install
            git submodule add $argv
        case update
            git submodule update $argv
        case ls list
            git submodule status $argv | cut -d' ' -f3
        case rm remove deinit
            git submodule deinit $argv
            # TODO: git rm -f msm/
        case -h --help
            echo "TODO: nemo help"
        case --uninstall
            rm */nemo.fish
        case '*'
            echo "Error: invalid subcommand $subcommand" >&2
    end

    popd

end
