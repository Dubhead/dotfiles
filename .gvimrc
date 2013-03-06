" .gvimrc

let c_comment_strings=1

set columns=80
set lines=62
set guicursor=a:blinkon0
set mousehide
set mousemodel=popup_setpos

" set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
" set guifont=DejaVu\ Sans\ Mono\ 8
" set guifont=Kochi\ Gothic\ 9
" set guifontwide=VL\ Gothic\ 8

" set guifont=Inconsolata\ Medium\ 8
" set guifontwide=Inconsolata\ Medium\ 8
" set linespace=-1

set guifont=Liberation\ Mono\ 8
set guifontwide=Liberation\ Mono\ 8
set linespace=-1

" Highlight the current line.  See http://www.vim.org/tips/tip.php?tip_id=1293
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
autocmd BufLeave * set nocursorline
autocmd BufEnter * set cursorline
highlight CursorLine guibg=gray80

set colorcolumn=81
highlight ColorColumn guibg=gray80

" eof
