local function init ()
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.incsearch = true
  vim.opt.hlsearch = true
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.mouse = "a"
end

return {
  init = init
}
