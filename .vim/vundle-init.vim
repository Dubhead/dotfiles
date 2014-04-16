" ~/.vim/vundle-init.vim -- to be source'd from vimrc
"
" Initial plugin installation:
" % mkdir -p ~/3rdPartyRepos/Vundle
" % cd $!
" % git clone http://github.com/gmarik/vundle.git .
" % cd ~/.vim/bundle
" % ln -s ~/3rdPartyRepos/Vundle vundle
" % cd ~/.vim
" % vim -u THIS_FILE +BundleInstall +q
"
" Install and update plugins:
" :BundleInstall!
"
" Search and install plugin:
" :Bundles PLUGIN_NAME

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" plugins at GitHub
Bundle 'yegappan/mru'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Blackrush/vim-gocode'
" Bundle 'Townk/vim-autoclose'
Bundle 'majutsushi/tagbar'
" Bundle 'mhinz/vim-startify'
Bundle 'kana/vim-smartinput'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-characterize'
Bundle 'airblade/vim-gitgutter'

" plugins at www.vim.org
Bundle 'mark_tools'
" Bundle 'QuickBuf' -- This contains bugs; use my modified version.

" other Git repositories
" Bundle 'git://git.example.com/foobar.git'

filetype on

" eof
