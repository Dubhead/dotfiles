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
call vundle#begin()
Plugin 'gmarik/vundle'
" Plugin 'VundleVim/Vundle'

" plugins at GitHub
" Plugin 'Townk/vim-autoclose'
" Plugin 'mhinz/vim-startify'
" Plugin 'Blackrush/vim-gocode'
Plugin 'airblade/vim-gitgutter'
Plugin 'kana/vim-smartinput'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'msanders/snipmate.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-sleuth'
Plugin 'yegappan/mru'

" plugins at www.vim.org
" Plugin 'mark_tools'
" Plugin 'QuickBuf' -- This contains bugs; use my modified version.

" other Git repositories
" Plugin 'git://git.example.com/foobar.git'

call vundle#end()
filetype on

" eof
