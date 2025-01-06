local function create_lsp_format_on_save_autocommand()
  local function lsp_format_on_save()
    vim.lsp.buf.format()
  end

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = lsp_format_on_save,
  })
end

local function create_whitespace_trim_on_save_autocommand()
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    command = ':%s/\\s\\+$//e',
  })
end

local function init()
  create_lsp_format_on_save_autocommand()
end

return {
  init = init
}
