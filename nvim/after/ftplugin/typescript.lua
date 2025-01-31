local function setup_lsp()
  vim.lsp.start({
    name = 'typescript-language-server',
    cmd = { 'typescript-language-server', '--stdio' },
  })
end

setup_lsp()
