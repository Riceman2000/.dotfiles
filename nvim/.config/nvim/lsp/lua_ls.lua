vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server", "--stdio" },
  filetypes = { "lua" },
  root_markers = {
    '.git',
  },
  single_file_support = true,
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}
