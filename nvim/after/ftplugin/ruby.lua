local function setup_lsp()
  vim.lsp.start({
    name = 'sorbet-lsp',
    cmd = { 'bin/bundle', 'exec', 'srb', 'typecheck', '--lsp' },
  })
end

setup_lsp()
