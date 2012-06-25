" --                                                            # {{{1
"
" File        : cfg-sodium/vimrc
" Maintainer  : Felix C. Stegerman <flx@obfusk.net>
" Date        : 2012-06-25
"
" Copyright   : Copyright (C) 2012  Felix C. Stegerman
" Licence     : GPLv2
"
" --                                                            # }}}1

" toggle:             set list! wrap! is! hls! paste! spell!
" set:                set spellang=...
" commands:           gq ap ... :%s!\s\+$!!g
" useful in [mg]vim:  set ...=*

" --

set rtp+=~/opt/src/vimclojure       " before filetype !!!
let vimclojure#ParenRainbow = 1

au BufNewFile,BufRead *.cljs,*.fnjs,*.fnjm set filetype=clojure

filetype plugin on
filetype indent off

" --

" from OS X vimrc (example) {

" filetype plugin indent on

set bs=2 mls=0 nocp
set ai hi=1000 sc

" } from OS X vimrc (example)

" --

syn on

set bg=dark bk nu ru
set tw=70 sw=2 sts=2 et fdm=marker

let loaded_matchparen = 1

" --

" from dakrone {

set fdc=4 ls=2 wmnu

" set cul lbr more si lcs=... t_Co=16   " ???

highlight OverLen cterm=reverse
match OverLen /\%81v.*/                 " reverse @ >= 80 columns

set dictionary=/usr/share/dict/words    " ???

" } from dakrone

" --

let hs_highlight_boolean    = 1
let hs_highlight_debug      = 1
let hs_highlight_delimiters = 1
let hs_highlight_more_types = 1
let hs_highlight_types      = 1

" --

let g:netrw_list_hide       = '^\.'
let g:netrw_sort_sequence   = ''

" --

" TODO: see vinter, debian/ubuntu !!!

" vim: set tw=70 sw=2 sts=2 et fdm=marker :