function myps
  /bin/ps axwwfo stat,user,pid,pcpu,pmem,cmd 2>&1 | /usr/bin/less
end
