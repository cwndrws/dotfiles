local lsp_utils = require "lsp_utils"

local function setup_lsp()
  vim.lsp.start(lsp_utils.setup_lsp_server({ 'gopls' })
end

local function apply_editor_settings()
  vim.bo.tabstop = 2
  vim.bo.softtabstop = 0
  vim.bo.expandtab = false
  vim.bo.shiftwidth = 2
end

apply_editor_settings()
setup_lsp()
