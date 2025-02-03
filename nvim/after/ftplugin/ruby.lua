local lsp_utils = require "lsp_utils"

local function setup_lsp()
  vim.lsp.start(lsp_utils.setup_lsp_server({ 'bin/bundle', 'exec', 'srb', 'typecheck', '--lsp' }, 'sorbet-lsp')
end

setup_lsp()
