local function setup_lsp()
  vim.lsp.start({
    name = 'rust-analyzer',
    cmd = {'rust-analyzer'},
  })
end

setup_lsp()
