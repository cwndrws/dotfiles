local function init()
  vim.cmd('colorscheme gruvbox')
  -- Set below to "light" if you want a brighter screen
  vim.opt.background = "dark"
end

return {
  init = init
}
