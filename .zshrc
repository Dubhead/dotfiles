# .zshrc

unset GLOBAL_RCS
unalias -m '*'
unfunction -m '*'

# /usr/bin/test -t 0 && /bin/stty erase 0x08 stop undef
# /usr/bin/test -t 0 && /bin/stty dec stop undef
/usr/bin/test -t 0 && /bin/stty stop undef

autoload -U compinit zmv
compinit
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:cd:*' ignore-parents parent pwd

setopt autopushd pushdignoredups pushdminus pushdsilent
setopt appendhistory histignoredups histignorespace
setopt listpacked magicequalsubst
setopt markdirs cshnullglob
setopt printeightbit
unsetopt autoremoveslash rmstarsilent
ulimit -c 0

DIRSTACKSIZE=16
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS="${WORDCHARS:s#/#}|"

if [[ $DISPLAY == ":0.0" ]]; then
        # chpwd () { print -Pn "\e]0;%3~ - %m - mlterm\a"}
        # export TERM="xterm-xfree86"
        export TERM="xterm-color"
        # export TERM="rxvt"
fi

# emacs-style keybinds with some mods
bindkey -e
bindkey "\C-R" history-beginning-search-backward
bindkey "\C-S" history-beginning-search-forward
bindkey "\C-U" backward-kill-line

# function cdback() {
# 	builtin cd - > /dev/null
# 	zle -U "^M"	# Replace "^M" with a newline!
# }
# zle -N cdback
# bindkey "\C-^" cdback
#
clear-screen-rehash() {
    zle clear-screen
    rehash
    zle reset-prompt
}
zle -N clear-screen-rehash
bindkey '^L' clear-screen-rehash

# color scheme for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# aliases and functions
#
alias date='/bin/date --rfc-3339=seconds'
# alias em='/usr/local/bin/emacsclient'
alias grep='/bin/grep --color=auto'
alias gvimrem='/usr/bin/gvim --remote-silent'
alias -g L='|/usr/bin/less'
alias -g L2='2>&1|/usr/bin/less'
# alias -g LV='|/usr/bin/lv'
l () {
        # LANG=POSIX /bin/ls -lhtAFG --color=always $* | /usr/bin/head -20
        # LC_TIME=ja_JP.utf-8 /bin/ls -lhtAFG --color=always $* | /usr/bin/head -20
        LC_ALL=POSIX /bin/ls -lhtAFG --time-style=long-iso --color=always $* | /usr/bin/head -20
}
# alias ls='LANG=POSIX /bin/ls -FG --group-directories-first --color=auto'
alias ls='/bin/ls -FG --group-directories-first --color=auto'
alias man='LANG=C /usr/bin/man'
alias myps='/bin/ps axo stat,ppid,pid,cmd 2>&1 | /usr/bin/less'
orig () {
        for i in $*; do
                /bin/cp -p ${i} ${i}.orig
                /bin/chmod 0444 ${i}.orig
        done
}
alias pstree='/usr/bin/pstree -paUl'
if [ -x /usr/bin/trash-put ]; then alias rm='/usr/bin/trash-put';
else alias rm='/bin/mv --backup=numbered --target-directory=${HOME}/.Trash/';
fi
alias RM='/bin/rm -rf'
if [ -x /usr/bin/inotail ]; then alias tail='/usr/bin/inotail'; fi

# site-locals
if [ -f ~/.zsh.local ]; then source ~/.zsh.local; fi

# eof
