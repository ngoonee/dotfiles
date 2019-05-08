# Looks for .venv file and activates the conda environment mentioned there
#
function cd --description 'change directory'
    set -l root_dir /
    builtin cd $param $argv
    set -l check_dir (pwd)
    while not test "$check_dir" = "$root_dir"
        if test -f "$check_dir/.venv"
            read -x venv_name < "$check_dir/.venv"
            if not test "$venv_name" = "$CONDA_DEFAULT_ENV"
                echo "Activating conda environment $venv_name"
                conda activate $venv_name
                if test $status = 1  # Fallback to virtualfish
                    vf activate $venv_name
                end
            end  # if ...
            echo
            break;
        else
            set check_dir (command dirname "$check_dir")
        end  # if ... else ...
    end  # while
end  # function
