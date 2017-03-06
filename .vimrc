execute pathogen#infect()
Helptags
syntax on

let mapleader = "\<Space>"
"gui stuff
set guifont=Inconsolata-dz\ for\ Powerline
set guioptions-=L
set guioptions-=r
set guioptions-=R


filetype plugin indent on
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

"" nerdtree setup
" Open nerdtree when starting vim with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open nerdtree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if nerdtree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Listcars settigns
set list
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText guifg=#4a4a59 ctermfg=18
highlight SpecialKey guifg=#4a4a59 ctermfg=18

" Make yank buffer work with system clipboard
set clipboard=unnamed
