function grepr
  /bin/grep -n --color=auto -I -r --exclude-dir=.svn --exclude-dir=.git --exclude-dir=.hg $argv
end
