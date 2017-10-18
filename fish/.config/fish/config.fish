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
        set SUBSTRING (eval echo $INPUT| awk '{ print substr( $0, length($0) - 19, length($0) ) }')
        tmux rename-window "..$SUBSTRING"
    end
end

# Use virtualfish
eval (python -m virtualfish auto_activation)
