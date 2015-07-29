# for login shell only:
if status --is-login
end

if test -e /etc/profile.d/autojump.fish
    . /etc/profile.d/autojump.fish
end

set fish_greeting ""

# eof
