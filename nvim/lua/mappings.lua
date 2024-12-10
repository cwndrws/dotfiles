local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
    map('n', lhs, rhs, opts)
end

local function init ()
  -- Setup leader
  nmap('<Space>', '')
  vim.g.mapleader = ' '

  -- <Leader><direction> -- move to the window to the <direction>
  nmap('<Leader>h', '<C-w>h')
  nmap('<Leader>j', '<C-w>j')
  nmap('<Leader>k', '<C-w>k')
  nmap('<Leader>l', '<C-w>l')

  -- <Leader>w -- other window commands
  nmap('<Leader>w', '<C-w>')

  -- <Leader><Leader>o -- open last buffer
  nmap('<Leader><Leader>o', '<C-^>')

  -- <Leader>e -- Edit file, starting in the same directory as current file.
  nmap('<Leader>e', ":edit <C-R>=expand('%:p:h') . '/'<CR>")

  -- <Leader>s -- Open split and start editing file, starting in the same directory as current file
  nmap('<Leader>s', ":split <C-R>=expand('%:p:h') . '/'<CR>")

  -- <Leader>v -- Open vertical split and start editing file, starting in the same directory as current file
  nmap('<Leader>v', ":vsplit <C-R>=expand('%:p:h') . '/'<CR>")

  -- <Leader>f -- file fuzzy finder with fzf
  nmap('<Leader>f', ':Files <CR>')

  -- <Leader>b -- fuzzy finder for open buffers
  nmap('<Leader>b', ':Buffers <CR>')

  -- <Leader>F -- search with ripgrep
  nmap('<Leader>F', ':Rg ')

  -- <Leader>* -- search with ripgrep word under cursor
  nmap('<Leader>*', ':Rg <C-R>=expand(\'<cword>\')<CR><CR>')

  -- Map arrow keys to quickfix navigation
  nmap('<Up>', ':cprevious<CR>')
  nmap('<Down>', ':cnext<CR>')
  nmap('<Left>', ':cpfile<CR>')
  nmap('<Right>', ':cnfile<CR>')

  -- Map shift + arrow keys to location list navigation
  nmap('<S-Up>', ':lprevious<CR>')
  nmap('<S-Down>', ':lnext<CR>')
  nmap('<S-Left>', ':lpfile<CR>')
  nmap('<S-Right>', ':lnfile<CR>')

  -- <Leader>T -- Run the nearest test to the cursor
  -- TODO(cwndrws): Figure out how to do this.
  --
  -- What I'm thinking the behavior of <Leader>t
  -- this:
  -- When run for the first time, prompt for what command you want to run
  -- When run subsequent times, the same command is run again
  -- <Leader>T will treat it like the first time, wiping out whatever we had
  -- saved as the test command when we ran <Leader>t the first time.

  -- TODO(cwndrws): figure out if we want lsp mappings in here, or if we want
  -- them somewhere else

  -- Avoid unintentional switches to Ex mode
  nmap ('Q', '<nop>')
end

return {
  init = init
}
