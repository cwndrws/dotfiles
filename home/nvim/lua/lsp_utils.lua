local coq = require "coq"

local function setup_lsp_server(cmd, name)
  name = name or cmd[1]
  return coq.lsp_ensure_capabilities({
    name = name,
    cmd = cmd
  })
end

return {
  setup_lsp_server = setup_lsp_server
}
