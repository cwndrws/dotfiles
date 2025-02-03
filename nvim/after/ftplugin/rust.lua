local lsp_utils = require "lsp_utils"

local function setup_lsp()
  vim.lsp.start(lsp_utils.setup_lsp_server({ 'rust-analyzer' }))
end

local function apply_editor_settings()
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 2
  vim.bo.expandtab = true
end

setup_lsp()
apply_editor_settings()
