-- this paste function is to avoid pasting from the system clipboard since
-- that's probably not necessary and makes autocomplete with coq super slow
-- I got this hack from https://github.com/neovim/neovim/discussions/28010#discussioncomment-9877494
local function paste()
  return {
    vim.split(vim.fn.getreg(''), '\n'),
    vim.fn.getregtype(''),
  }
end

local function init()
  vim.o.clipboard = 'unnamedplus'

  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = paste,
      ['*'] = paste,
    },
  }
end

return {
  init = init
}
