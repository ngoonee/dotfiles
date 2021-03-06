# Ctrl-o to open ranger, and change directory when closing it
function ranger-cd
  set tempfile '/tmp/chosendir'
  /usr/bin/ranger --choosedir=$tempfile (pwd)
  if test -f $tempfile
      if [ (cat $tempfile) != (pwd) ]
        cd (cat $tempfile)
      end
  end
  rm -f $tempfile
end
function fish_user_key_bindings
    bind \co 'ranger-cd ; fish_prompt'
    bind -M insert \co 'ranger-cd ; fish_prompt'
end

# Set the tmux window title, depending on whether we are running something, or just prompting
function fish_title
    if [ "fish" != $_ ]
        tmux rename-window "$_ $argv"
    else
        tmux_directory_title
    end
end
function tmux_directory_title
    if [ "$PWD" != "$LPWD" ]
        set LPWD "$PWD"
        set INPUT $PWD
        set SUBSTRING (string escape $INPUT)
        tmux rename-window "..$SUBSTRING"
    end
end

# Save history repeatedly
function save_history --on-event fish_preexec
    history --save
    history --merge
end

# Use virtualfish
#eval (/usr/bin/python -m virtualfish auto_activation)
#eval (/usr/bin/python -m virtualfish)

source /home/ngoonee/anaconda3/etc/fish/conf.d/conda.fish

