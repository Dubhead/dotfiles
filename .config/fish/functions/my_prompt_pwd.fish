function my_prompt_pwd
  set -g __fish_my_prompt_pwd (echo $PWD | sed -e "s|^$HOME|~|" | grep -Eo '[^/]+/[^/]+/[^/]+/?$')
  switch "$__fish_my_prompt_pwd"
    case ""
      set -g __fish_my_prompt_pwd (echo $PWD | sed -e "s|^$HOME|~|")
  end
  echo "$__fish_my_prompt_pwd"
end
