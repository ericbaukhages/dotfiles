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

function! NewScratchEntry()
	let timestamp = "\#\# " . system("date +'\%I:\%M\%p'") . "\n\n"
	let newEntryLineNumber = 0

	if !(line('$') ==# 1)
		normal G
		normal o

		let newEntryLineNumber = line('$')
	endif

	call append(newEntryLineNumber, split(timestamp, "\n")) " use `split` if there are multiple lines

	normal G
endfunction

augroup markdown
	autocmd Filetype markdown nnoremap <buffer> <silent> ++ :call NewScratchEntry()<cr>
	autocmd Filetype markdown setlocal spell linebreak
augroup END

function! CloseIfTermResults()
	if bufname() =~ "term://"
		q
	endif
endfunction

augroup bash
	autocmd Filetype termresults nnoremap <buffer> <cr> :call CloseIfTermResults()<cr>
	autocmd Filetype sh nnoremap <buffer> <cr> <cmd> vsp term://./$<cr> <cmd> set filetype=termresults<cr>

	autocmd Filetype sh nnoremap <buffer> <leader>x :w<cr>:Chmod +x<cr>i#!/bin/bash<cr><cr>
augroup END

"}}}

" vim: fdm=marker
