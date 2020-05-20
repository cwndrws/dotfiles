call plug#begin('~/.local/share/nvim/plugged')
" language server
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" tooling plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
" for git stuff
Plug 'tpope/vim-fugitive'
" language plugins
Plug 'leafgarland/typescript-vim'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'dag/vim-fish'
Plug 'tpope/vim-rails'
" color plugin
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
" Task Warrior
Plug 'blindFS/vim-taskwarrior'
" Moving around
Plug 'easymotion/vim-easymotion'
call plug#end()

" language server config
" Required for operations modifying multiple buffers like rename.
set hidden
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
" disable the auto-folding globally
let g:lsp_fold_enabled = 0

if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

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
set list
set listchars=tab:▸\ ,eol:¬,space:·
highlight NonText guifg=#4a4a59 ctermfg=18
highlight SpecialKey guifg=#4a4a59 ctermfg=18

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

" set airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" tmux status line
let g:tmuxline_preset = 'full'

" easy motion settings
let g:EasyMotion_smartcase = 1
