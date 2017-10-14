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
