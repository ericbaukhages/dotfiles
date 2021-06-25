" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'

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

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end

EOF

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
	autocmd Filetype sh nnoremap <buffer> <cr> <cmd> vsp term://./%<cr> <cmd> set filetype=termresults<cr>

	autocmd Filetype sh nnoremap <buffer> <leader>x :w<cr>:Chmod +x<cr>i#!/bin/bash<cr><cr>
augroup END

"}}}

" vim: fdm=marker
