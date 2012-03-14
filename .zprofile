# ~/.zprofile

# export MANPATH="/usr/local/man:/usr/share/man"
typeset -U manpath
manpath=(
    /usr/local/share/man(N-/)
    /usr/local/man(N-/)
    /usr/share/man(N-/))

export EDITOR="/usr/bin/vim"
# export LANG=ja_JP.UTF-8
unset LANGUAGE
export LC_MESSAGES=C
export LESS=-aij3qRsS
export LESSHISTFILE=-
export PAGER=/usr/bin/less
export SKK_JISYO=/usr/share/skk/SKK-JISYO.L
# export SKKSERV=/usr/sbin/yaskkserv_normal
export SKKSERVER=localhost
# SSH_ASKPASS="/usr/bin/ssh-askpass"
export TZ=Asia/Tokyo
# export XMODIFIERS="@im=uim"

# Go Programming Language http://golang.org/doc/install.html
export GOROOT=${HOME}/3rdPartyRepos/go
# export GOOS=linux
# export GOARCH=386
# export GOBIN=${HOME}/gobin	# It's now ~/3rdPartyRepos/go/bin

# eof
