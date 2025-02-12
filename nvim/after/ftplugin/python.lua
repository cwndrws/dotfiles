local lsp_utils = require "lsp_utils"

local function setup_lsp()
  vim.lsp.start(lsp_utils.setup_lsp_server({ 'ruff', 'server' }))
end

setup_lsp()
