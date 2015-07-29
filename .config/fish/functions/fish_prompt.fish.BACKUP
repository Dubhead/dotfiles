function fish_prompt
  if not set -q __fish_prompt_username
    switch $USER
        case root
	    set -g __fish_prompt_username 'root '
	case '*'
	    set -g __fish_prompt_username ''
    end
  end

  echo -n "$__fish_prompt_username"
  echo -n '% '
end
