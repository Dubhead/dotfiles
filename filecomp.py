#!/usr/bin/python

import glob
import os
import subprocess
import sys

HOME = os.environ['HOME']
DOTFILES_DIR = os.path.join(HOME, 'dotfiles')
EXCLUDES = [os.path.basename(sys.argv[0]), "README", ".git"]

os.chdir(DOTFILES_DIR)
for f in sorted(glob.glob('*') + glob.glob('.*')):
    if f in EXCLUDES:
        continue
    # print(f)
    dotfile_in_home = os.path.join(HOME, f)
    subprocess.call(['diff', '-u', dotfile_in_home, f])

# eof
