# for login shell only:
if status --is-login
end

if test -e /usr/share/autojump/autojump.fish
    . /usr/share/autojump/autojump.fish
end

set fish_greeting ""

# eof
