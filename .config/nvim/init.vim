" nvim settings {{{1
set number
set hlsearch
set signcolumn=yes

set autoindent
set smartindent
set noexpandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set undofile

" shortcuts {{{2
" command mode Emacs-style movement keys, also found in bash/zsh
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
"}}}2
"}}}

" language specific settings {{{1
" gitcommit {{{2
autocmd Filetype gitcommit setlocal spell textwidth=72
"}}}2

" markdown {{{2
function! NewScratchEntry()
  let timestamp = "\#\# " . system("date +'\%I:\%M\%p'") . "\n\n"
  let newEntryLineNumber = 0

  if !(line('$') ==# 1)
    " I wanted to add a `\n` to timestamp, but that didn't work for some reason
    normal G
    normal o

    let newEntryLineNumber = line('$')
  endif

  " if needed, you can check if there's only one line in the file: `if line('$') ==# 1`
  call append(newEntryLineNumber, split(timestamp, "\n")) " use `split` if there are multiple lines

  normal G
endfunction

augroup markdown
  autocmd Filetype markdown nnoremap <buffer> <silent> ++ :call NewScratchEntry()<cr>
  autocmd Filetype markdown setlocal spell linebreak conceallevel=2
  autocmd Filetype markdown let b:surround_91 = "[\r](\1link: \1)"
  autocmd Filetype markdown let b:surround_42 = "**\r**"
augroup END
"}}}2

" bash {{{2
function! CloseIfTermResults()
  if bufname() =~ "term://"
    q
  endif
endfunction

augroup bash
  autocmd Filetype termresults nnoremap <buffer> <cr> :call CloseIfTermResults()<cr>
  autocmd Filetype sh nnoremap <buffer> <cr> <cmd> vsp term://./%<cr> <cmd> set filetype=termresults<cr>

  autocmd Filetype sh nnoremap <buffer> <leader>x :w<cr>:Chmod +x<cr>i#!/usr/bin/env bash<cr><cr>
augroup END
"}}}2

" scss {{{2
augroup scss
	autocmd Filetype scss setlocal iskeyword+=@-@
	autocmd Filetype scss setlocal iskeyword+=-
	autocmd Filetype scss setlocal iskeyword+=$
augroup END
"}}}2
"}}}

" plugins {{{1
call plug#begin("./plugged")
Plug 'APZelos/blamer.nvim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()
"}}}1

" plugin specific settings {{{1
" fzf {{{2
map <leader>f :FZF<cr>
nnoremap ; :Buffers<cr>

function! RgCurrentWord()
  execute ':Rg '.expand('<cword>')
endfunction

nmap <silent> gR :call RgCurrentWord()<cr>
"}}}2

" APZelos/blamer.nvim {{{2
let g:blamer_enabled = 1
let g:blamer_delay = 200
let g:blamer_date_format = '%Y-%m-%d %H:%M'
let g:blamer_show_in_visual_modes = 0
"}}}2
"}}}1

" vim: fdm=marker
