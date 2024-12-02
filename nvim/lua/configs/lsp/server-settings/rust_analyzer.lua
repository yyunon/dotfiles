local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.11.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local lspconfig = require("lspconfig")
local cfg = require("rustaceanvim.config")
return {
  cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        overrideCommand = {
          "cargo",
          "clippy",
          "--message-format=json",
        }
      },
      lspMux = {
        version = "1",
        method = "connect",
        server = "rust-analyzer",
      },
      cargo = {
        features = "all"
      },
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      }
    },
  }
}
