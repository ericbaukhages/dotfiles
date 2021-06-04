" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-signify'

call plug#end()
"}}}

" Options {{{
set hlsearch
set number
set undofile
set signcolumn=yes
"}}}

" Autocmds {{{
autocmd Filetype gitcommit setlocal spell textwidth=72
"}}}

" vim: fdm=marker:sw=2:sts=2:et
