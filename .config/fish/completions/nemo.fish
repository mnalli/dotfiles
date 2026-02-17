complete -c nemo --exclusive --long help --description "Print help"
complete -c nemo --exclusive --long uninstall --description "Uninstall Nemo"

complete -c nemo --exclusive --condition __fish_use_subcommand -a "add install" --description "Install plugins"
complete -c nemo --exclusive --condition __fish_use_subcommand -a update --description "Update installed plugins"
complete -c nemo --exclusive --condition __fish_use_subcommand -a "rm remove deinit" --description "Remove installed plugins"
complete -c nemo --exclusive --condition __fish_use_subcommand -a "ls list" --description "List installed plugins"

complete -c nemo --exclusive --condition "__fish_seen_subcommand_from add install" -a "(cd $nemo_path; complete -C 'git submodule add ')"
complete -c nemo --exclusive --condition "__fish_seen_subcommand_from update" -a "(cd $nemo_path; complete -C 'git submodule update ')"
complete -c nemo --exclusive --condition "__fish_seen_subcommand_from rm remove deinit" -a "(cd $nemo_path; complete -C 'git submodule deinit ')"
complete -c nemo --exclusive --condition "__fish_seen_subcommand_from ls list" -a "(cd $nemo_path; complete -C 'git submodule status ')"
