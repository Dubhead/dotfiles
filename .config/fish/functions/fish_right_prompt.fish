function fish_right_prompt
  switch "$status"
  case '0'
    set -g __fish_prompt_status ''
  case '*'
    set -g __fish_prompt_status " $status"
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end
  if not set -q __fish_prompt_cwd
    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
  end
  if not set -q __fish_prompt_error
    set -g __fish_prompt_error (set_color $fish_color_error)
  end
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname -s)
  end

  echo -n "$__fish_prompt_cwd" (my_prompt_pwd) "$__fish_prompt_normal"
  echo -n "$__fish_prompt_hostname"
  echo -n "$__fish_prompt_error$__fish_prompt_status$__fish_prompt_normal"
end
