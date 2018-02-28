" <Leader><dir> -- move to the window to the <dir>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" <Leader>w -- other window commands
nnoremap <Leader>w <C-w>

" <Leader>d -- page down
nnoremap <Leader>d <C-d>

" <Leader>u -- page up
nnoremap <Leader>u <C-u>

" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader>o <C-^>

" <Leader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
nnoremap <Leader>p :echo expand('%')<CR>

" <Leader>pp -- Like <Leader>p, but additionally yanks the filename and sends it
" off to Clipper.
nnoremap <Leader>pp :let @0=expand('%') <Bar> :Clip<CR> :echo expand('%')<CR>

" <Leader>e -- Edit file, starting in same directory as current file.
nnoremap <Leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" <Leader>e -- Edit file, starting in same directory as current file.
nnoremap <Leader>s :split <C-R>=expand('%:p:h') . '/'<CR>

" <Leader>e -- Edit file, starting in same directory as current file.
nnoremap <Leader>v :vsplit <C-R>=expand('%:p:h') . '/'<CR>

" <Leader>f -- ripgrep file fuzzy finder with fzf
nnoremap <Leader>f :Files <CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" <Leader>F -- ripgrep live fuzzy search with fzf
nnoremap <Leader>F :Find <CR>
