
set -g nemo_path $__fish_config_dir/nemo

# ensure directory existence
mkdir -p $nemo_path

set -a fish_complete_path $nemo_path/*/completions
set -a fish_function_path $nemo_path/*/functions

for file in $nemo_path/*/conf.d/*.fish
    . $file
end

for dir in $nemo_extra_dirs
    set -l dir_path $nemo_path/$dir

    test -d $dir_path/completions && set -a fish_complete_path $dir_path/completions
    test -d $dir_path/functions   && set -a fish_function_path $dir_path/functions

    for file in $dir_path/conf.d/*.fish
        . $file
    end

end
