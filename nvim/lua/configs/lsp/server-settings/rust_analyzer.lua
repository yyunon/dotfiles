local lspconfig = require("lspconfig")
return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  }
}
