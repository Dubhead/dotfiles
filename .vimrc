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
set cedit=<Esc>
set cinoptions=:0,l1,g0,N-s,(s
" set directory=c:\\tmp,.
set clipboard+=unnamed
set directory=/tmp,.,~/
set nofoldenable
" set grepprg=internal
set grepprg=/usr/bin/ack\ -H\ --column\ --nocolor\ --nogroup
set grepformat=%f:%l:%c:%m
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
" set scrolloff=2
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
set viminfo=!,'0,<0,@0,f0,h    " '!' for mru.vim
set wildignore=*.o
set wildmode=list:longest
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

"""" maps """"

" Toggle read-only for local buffer.
map <C-Q> :silent setl invreadonly<CR>\|:setl readonly?<CR>

" Ctrl-L also clears searched-word hilighting.
noremap <C-L> :noh<CR>:lcd %:p:h<CR><C-L>

" B for braces
inoremap <silent> <C-B> <END>{<ESC>:call setline(".", substitute(getline("."), "\\S\\zs\\s*\\%#", " ", ""))<CR>o}<ESC>O<C-T>

" make the last word UPPERCASE or Camelcase.  See :help gU
inoremap <M-u> <Esc>gUiw`]a
inoremap <M-c> <ESC>bgUllgue`^a

" do :grep for the word under cursor
nnoremap <F8> :grep -w <cword><CR>

" Save all modified, and run make.
map <F9> :silent wall<CR>\|:make<CR>

" QuickFix list navigation
map <C-N> :cnext<CR>
map <C-P> :cprev<CR>

" Alt-BackSpace to delete last word
inoremap <M-BS> <C-W>
noremap <M-BS> db

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

" Search open parens.
nnoremap <silent> ) :<C-u>call search("\\((\\\\|\\[\\\\|{\\\\|<\\\\|「\\\\|『\\)\\zs")<CR>
nnoremap <silent> ( :<C-u>call search("\\((\\\\|\\[\\\\|{\\\\|<\\\\|「\\\\|『\\)\\zs", 'b')<CR>

" Change currend word to yanked text.
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" Write file that I don't own.
cmap w!! %!sudo tee > /dev/null %

"""" plugins """"

" manpage viewer: See :help Man
runtime ftplugin/man.vim
map K <Leader>K

" QuickBuf http://www.vim.org/scripts/download_script.php?src_id=7198
let g:qb_hotkey = "_"

" taglist.vim
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" let Tlist_Inc_Winwidth = 0

" tagbar.vim
let g:tagbar_left = 1

" mru.vim
let MRU_Max_Entries = 30
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" let MRU_Window_Height = 16
" let MRU_Use_Current_Window = 1
" let MRU_Auto_Close = 0

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

" C and C++
autocmd FileType c,cpp imap <TAB> _EXPAND_ME<C-]>
autocmd FileType c,cpp inorea c_EXPAND_ME const
autocmd FileType c,cpp inorea f_EXPAND_ME for ()<LEFT>
autocmd FileType c,cpp inorea i_EXPAND_ME if ()<LEFT>
autocmd FileType c,cpp inorea il_EXPAND_ME #include ""<LEFT>
autocmd FileType c,cpp inorea in_EXPAND_ME #include <><LEFT>
autocmd FileType c,cpp inorea r_EXPAND_ME return;<LEFT>
autocmd FileType c,cpp inorea w_EXPAND_ME while ()<LEFT>
"
autocmd FileType cpp inorea b_EXPAND_ME begin(
autocmd FileType cpp inorea cl_EXPAND_ME class <CR>{<CR>public:<CR>private:<CR>};<UP><UP><UP><UP><END>
autocmd FileType cpp inorea e_EXPAND_ME end(
autocmd FileType cpp inorea it_EXPAND_ME iterator<SPACE>
autocmd FileType cpp inorea map_EXPAND_ME std::map<
autocmd FileType cpp inorea s_EXPAND_ME std::
autocmd FileType cpp inorea str_EXPAND_ME std::string
autocmd FileType cpp inorea t_EXPAND_ME try<CR>catch () {<CR>}<UP><UP><END>
autocmd FileType cpp inorea vec_EXPAND_ME std::vector<

" Python
autocmd FileType python setl expandtab
let python_highlight_all = 1    " See syntax/python.vim

" Go
autocmd BufRead,BufNewFile *.go setfiletype go
autocmd FileType go setl noexpandtab formatprg=$GOBIN/gofmt makeprg=$GOBIN/8g\ % shiftwidth=8

" Haskell
" let hs_highlight_delimiters = 1
" let hs_highlight_boolean = 1
" let hs_highlight_types = 1
" let hs_highlight_more_types = 1
" let hs_highlight_debug = 1
" let hs_allow_hash_operator = 1

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
" autocmd BufRead,BufNewFile *.ooc setfiletype ooc

" Pure
autocmd BufRead,BufNewFile *.pure setfiletype pure

" Nimrod
" autocmd BufRead,BufNewFile *.nim setfiletype nimrod

" Falcon
autocmd BufRead,BufNewFile *.fal setfiletype falcon

" eof
