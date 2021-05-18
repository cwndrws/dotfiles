call plug#begin('~/.vim/plugged')
" ALE - used for linting, formatting and language server
Plug 'w0rp/ale'
" tooling plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
" for git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Moving around
Plug 'easymotion/vim-easymotion'
" Fast html editing
Plug 'mattn/emmet-vim'
" RipGrep for search
Plug 'jremmen/vim-ripgrep'
" Pairing stuff
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
call plug#end()

" line number settings
set number relativenumber

" Key mappings
let mapleader = "\<Space>"

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" whitespace character settings
set listchars=tab:▸\ ,eol:¬,space:·

" indentation stuff
set tabstop=4
set shiftwidth=4
set expandtab
