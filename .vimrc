call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'chriskempson/base16-vim'
Plug 'rust-lang/rust.vim'
Plug 'nvie/vim-flake8'
Plug 'saltstack/salt-vim'
Plug 'vim-syntastic/syntastic'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
call plug#end()

"Helptags
set t_Co=256
set background=dark
let base16colorspace=256        " Access colors present in 256 colorspace
colorscheme base16-flat

let mapleader = "\<Space>"

set relativenumber
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set number
set backspace=2
set laststatus=2

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let $GOPATH = $HOME."/src/go"
let $GOROOT = $HOME."/go1.6"
let $GOBIN = $GOPATH."/bin"
"let $PATH = $GOBIN.$PATH

" silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" 80/120 char gutters
highlight ColorColumn ctermbg=black
let &colorcolumn="80,".join(range(120,999),",")

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']

" Listcars settings
set list
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText guifg=#4a4a59 ctermfg=18
highlight SpecialKey guifg=#4a4a59 ctermfg=18

" Make yank buffer work with system clipboard
set clipboard=unnamed
