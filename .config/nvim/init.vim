" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

call plug#end()
"}}}

" Options {{{
set number
set hlsearch
set undofile
set signcolumn=yes

set mouse=a

set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set autoindent
set nosmartindent

set backupcopy=yes
"}}}

" Plugin Options {{{
map <leader>f :FZF<cr>
nmap ; :Buffers<cr>
"}}}

" Autocmds {{{
autocmd Filetype gitcommit setlocal spell textwidth=72
"}}}

" vim: fdm=marker:sw=2:sts=2:et
