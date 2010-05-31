" ~/.vimrc

"""" language settings """"

let $LANG = "en_US.UTF-8"
" language en_US.UTF-8
language C
set ambiwidth=double
set encoding=utf-8
" set fileencoding=utf-8
if has('iconv')
  set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp
endif

"""" options """"

set autochdir
set autoindent
set backspace=indent,eol,start
" set backupdir=~/.vim_backup/,.,~/
set backupdir=/tmp,.,~/
set browsedir=buffer
set cinoptions=:0,g0
" set directory=c:\\tmp,.
set directory=/tmp,.,~/
" set grepprg=internal
" set grepprg=/usr/bin/ack\ $*
set grepprg=/usr/bin/ack\ --nocolor\ $*
set history=50
set hidden
set hlsearch
set incsearch
set isfname-==
set langmenu=none
set linebreak
set modeline
set nrformats=hex,alpha
set noruler
set secure
set sessionoptions=options,curdir,winpos,resize,winsize
set shiftround
set shiftwidth=4
set shortmess=aoOtI
set showbreak=>\
set noshowcmd
set showmatch
set noshowmode
" set splitbelow
set suffixes=.o,.orig,.pyc,.pyo,.beam,.class,.exe,.8,.di
set tags=./tags;
set tildeop
set viminfo=!,'0,\"0,@0,f0,h    " '!' for mru.vim
set wildignore=*.o
set wildmode=longest,list
set winfixheight
set nowrapscan

"""" display """"

" these should be here, NOT in .gvimrc
" default: "agimrLtT" (GTK, Motif and Athena)
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions+=cl

" syntax on
syntax enable
" colorscheme fine_blue
" colorscheme fruit
" colorscheme autumnleaf
colorscheme vc
" colorscheme delek

" Highlight redundant whitespaces.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" Highlight 'number' column.
highlight LineNr term=underline ctermbg=3 ctermfg=4 guifg=blue guibg=yellow

"""" key bindings """"

" Toggle read-only for local buffer.
map <C-Q> :silent setl invreadonly<CR>\|:setl readonly?<CR>

" Ctrl-L also clears searched-word hilighting.
noremap <C-L> :noh<CR>:lcd %:p:h<CR><C-L>

" B for braces
" imap <C-B> {<CR>}<ESC>O<C-T>
imap <C-B> {<ESC>:s/\S\zs\s*\%#/ /e<CR>:silent noh<CR>A<CR>}<ESC>O<C-T>

" make the last word UPPERCASE or Camelcase.  See :help gU
inoremap <M-u> <Esc>gUiw`]a
inoremap <M-c> <ESC>bgUllgue`^a

" Save all modified, and run make.
map <F9> :silent wall<CR>\|:make<CR>

" QuickFix list navigation
map <C-N> :cnext<CR>
map <C-P> :cprev<CR>

" taken from :help emacs-keys
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>

"""" plugins """"

" manpage viewer: See :help Man
runtime! ftplugin/man.vim
map K <Leader>K

" QuickBuf http://www.vim.org/scripts/download_script.php?src_id=7198
let g:qb_hotkey = "_"

" taglist.vim
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" let Tlist_Inc_Winwidth = 0

" mru.vim
let MRU_Max_Entries = 30
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" let MRU_Window_Height = 16
" let MRU_Use_Current_Window = 1
" let MRU_Auto_Close = 0

" diffchanges.vim http://www.vim.org/scripts/script.php?script_id=2158
nmap <F6> <Plug>DiffChangesDiffToggle
nmap <F7> <Plug>DiffChangesPatchToggle

" mark_tools.vim
" http://www.vim.org/scripts/script.php?script_id=2929
nmap <C-F2> <Plug>ToggleMarkAZ
nmap <F2> <Plug>NextMarkPos
nmap <S-F2> <Plug>PrevMarkPos
nmap <S-C-F2> <Plug>MarksLoc
" let toggle_marks_wrap_search = -1

" always cd to the directory where the current file is at
"
" This is enough if you never edit network files:
" autocmd BufEnter * lcd %:p:h
"
" from Vim Online, Tip #370
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]://" | silent! lcd %:p:h | endif
"
" This is obsolete in ver6.2 -- use new option 'autochdir'.

"""" filetypes """"

" filetype indent off
filetype plugin off

" Python
autocmd FileType python setl expandtab
let python_highlight_all = 1    " See syntax/python.vim

" Go
autocmd BufRead,BufNewFile *.go setfiletype go
autocmd FileType go setl noexpandtab formatprg=$GOBIN/gofmt makeprg=$GOBIN/8g\ % shiftwidth=8

" Haskell
let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1
let hs_allow_hash_operator = 1

" Vala http://live.gnome.org/Vala/Vim
" autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
" autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
" au BufRead,BufNewFile *.vala setfiletype vala
" au BufRead,BufNewFile *.vapi setfiletype vala

" Mono C#
" autocmd FileType cs compiler mcs

" Scala
" au BufRead,BufNewFile *.scala set filetype=scala

" Fantom
" autocmd BufRead,BufNewFile *.fan set filetype=fan

" Java
" let java_highlight_all=1
" let java_highlight_debug=1
" let java_highlight_java_lang_ids=1
" let java_allow_cpp_keywords=1
" let java_space_errors=1
" let java_highlight_functions="style"
"
" Note: This sets 'shellpipe=2>', disabling the grep/quickfix feature.
" autocmd BufNewFile,BufRead *.java compiler javac

" ooc
autocmd BufRead,BufNewFile *.ooc setfiletype ooc

" Pure
autocmd BufRead,BufNewFile *.pure setfiletype pure

" Nimrod
" autocmd BufRead,BufNewFile *.nim setfiletype nimrod

" eof
