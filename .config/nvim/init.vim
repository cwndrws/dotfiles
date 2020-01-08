call plug#begin('~/.local/share/nvim/plugged')
" tooling plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'
" for git stuff
Plug 'tpope/vim-fugitive'
" language plugins
Plug 'leafgarland/typescript-vim'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'dag/vim-fish'
" color plugin
Plug 'chriskempson/base16-vim'
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" linenum settings
set number relativenumber

" Key mappings
let mapleader = "\<Space>"

" Make yank buffer work with system clipboard
set clipboard=unnamed

" search settings
set incsearch
set hlsearch

" Listcars settings
set list
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText guifg=#4a4a59 ctermfg=18
highlight SpecialKey guifg=#4a4a59 ctermfg=18

" spell checking
set spelllang=en_us

" global lint/fix config
let g:ale_fix_on_save = 1

" indentation stuff
set tabstop=4
set shiftwidth=4
set expandtab

" autocomplete options
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert

" Allow project-specific settings
set exrc
set secure
