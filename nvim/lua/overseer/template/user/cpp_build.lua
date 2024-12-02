-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "make build",
  builder = function()
    return {
      cmd = { "make" },
      file = {"Makefile"},
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "Makefile", "cpp", "h" },
  },
}
