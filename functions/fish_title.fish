function fish_title --description 'Set window title'
  if [ $_ = 'fish' ]
    echo (prompt_pwd)
  else
    echo $_
  end
end
