local ok = pcall(require, "lspconfig")
if not ok then
  return
end

require "mr-rc.lsp.mason"
require("mr-rc.lsp.handlers").setup()

