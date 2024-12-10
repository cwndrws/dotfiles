local function setup_lsp()
  vim.lsp.start({
    name = 'lua-language-server',
    cmd = {'lua-language-server'},
  })
end

setup_lsp()

