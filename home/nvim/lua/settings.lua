local function setup_coq()
  vim.cmd("let g:coq_settings = { 'auto_start': v:true }")
end

local function plugin_specific_init()
  setup_coq()
end

local function init()
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
  plugin_specific_init()
end

return {
  init = init
}
