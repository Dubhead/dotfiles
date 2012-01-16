#!/usr/bin/python

import glob
import os
import subprocess
import sys

HOME = os.environ['HOME']
DOTFILES_DIR = os.path.join(HOME, 'dotfiles')
EXCLUDES = [os.path.basename(sys.argv[0]), "README", ".git"]

os.chdir(DOTFILES_DIR)
for root, dirs, files in os.walk(DOTFILES_DIR):
    for f in files:
        if (root == DOTFILES_DIR) and f in EXCLUDES:
            continue
        dotfile_in_dotfiles = os.path.join(root, f)
        dotfile_in_home = os.path.join(HOME,
            dotfile_in_dotfiles[len(DOTFILES_DIR)+1:])
        # print(dotfile_in_dotfiles, dotfile_in_home)
        subprocess.call(['diff', '-u', dotfile_in_dotfiles, dotfile_in_home])
        if '.git' in dirs:
            dirs.remove('.git')

# eof
