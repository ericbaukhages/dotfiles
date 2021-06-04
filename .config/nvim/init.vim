" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

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
