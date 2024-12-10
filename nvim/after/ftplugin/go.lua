local function setup_lsp()
  vim.lsp.start({
    name = 'gopls',
    cmd = {'gopls'},
  })
end

local function apply_editor_settings()
  vim.bo.tabstop = 2
  vim.bo.softtabstop = 0
  vim.bo.expandtab = false
  vim.bo.shiftwidth = 2
end

apply_editor_settings()
setup_lsp()
