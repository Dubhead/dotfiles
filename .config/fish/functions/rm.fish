function rm
  if test -x /usr/bin/trash-put
    /usr/bin/trash-put $argv
  else
    /bin/mv --backup=numbered --target-directory=$HOME/.Trash/ $argv
  end
end
