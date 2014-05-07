function fish_prompt --description 'Set prompt'
  set -l last_status $status

  set_color magenta
  echo -n '● '
  set_color normal

  # user@host
  # echo -n (whoami)
  # set_color blue
  # echo -n '@'
  # set_color normal
  # echo -n (hostname -s)
  # set_color blue
  # echo -n ':'
  # set_color normal

  # PWD
  set_color normal
  echo -n (prompt_pwd)
  set_color normal

  echo -n (__terlar_git_prompt | sed 's/\|/ /')

  if not test $last_status -eq 0
    set_color $fish_color_error
    echo -n " $last_status"
    set_color normal
  end

  set_color blue
  echo -n '❱ '
  set_color normal
end
