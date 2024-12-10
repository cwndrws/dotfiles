local function osc_52_clipboard()
   return {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  } 
end

local function tmux_buffer_clipboard()
  return {
    name = 'Tmux Buffer',
    copy = {
      ['+'] = {'tmux', 'load-buffer', '-'},
      ['*'] = {'tmux', 'load-buffer', '-'},
    },
    paste = {
      ['+'] = {'tmux', 'save-buffer', '-'},
      ['*'] = {'tmux', 'save-buffer', '-'},
    },
  }
end

local function init()
  if vim.env.TMUX == nil then
    print("using OSC 52 clipboard")
    vim.g.clipboard = osc_52_clipboard()
  else
    print("using tmux clipboard")
    vim.g.clipboard = tmux_buffer_clipboard()
  end
end

return {
  init = init
}
