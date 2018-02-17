call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
call plug#end()

set t_Co=256
set background=dark
let base16colorspace=256        " Access colors present in 256 colorspace
colorscheme base16-flat

" Key mappings
let mapleader = "\<Space>"
nmap <leader>w <c-w>
nmap <leader>o <c-o>
nmap <leader>i <c-i>
nmap <leader>d <C-d>
nmap <leader>u <C-u>

set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set backspace=2
set laststatus=2
set incsearch
set hlsearch

let $GOPATH = $HOME."/src/go"
let $GOROOT = $HOME."/go1.6"
let $GOBIN = $GOPATH."/bin"
let $PATH = $GOBIN.$PATH

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']

let g:syntastic_disabled_filetypes=['java']

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['java'] }

" Listcars settings
set list
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText guifg=#4a4a59 ctermfg=18
highlight SpecialKey guifg=#4a4a59 ctermfg=18

" Make yank buffer work with system clipboard
set clipboard=unnamed

let g:rustfmt_autosave = 1
