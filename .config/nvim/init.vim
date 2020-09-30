call plug#begin('~/.local/share/nvim/plugged')
" ALE - used for linting, formatting and language server
Plug 'w0rp/ale'
" deoplete for auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" tooling plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
" for git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" language plugins
Plug 'leafgarland/typescript-vim'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'dag/vim-fish'
Plug 'tpope/vim-rails'
" color plugin
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
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

" set color theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" line number settings
set number relativenumber

" Key mappings
let mapleader = "\<Space>"

" Make yank buffer work with system clipboard
set clipboard=unnamed

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" whitespace character settings
set listchars=tab:▸\ ,eol:¬,space:·

" spell checking
set spelllang=en_us
set spell

" indentation stuff
set tabstop=4
set shiftwidth=4
set expandtab

" autocomplete options
set completeopt=menu,menuone,preview,noselect,noinsert

" Allow project-specific settings
set exrc
set secure

" set airline tabline:
let g:airline#extensions#tabline#enabled = 1

" tmux status line
let g:tmuxline_preset = 'full'
let g:tmuxline_powerline_separators = 0

" easy motion settings
let g:EasyMotion_smartcase = 1

"ALE global settings
let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fix_on_save = 1

" deoplete config
let g:deoplete#enable_at_startup = 1
