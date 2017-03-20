function l
  env LC_ALL=POSIX /bin/ls -lhtAFG --time-style=long-iso --color=always $argv | /usr/bin/head -n 20
end
