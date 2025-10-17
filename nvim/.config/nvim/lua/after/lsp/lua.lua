vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server", "--stdio" },
  filetypes = { "lua" },
  root_markers = {
    '.git',
  },
  single_file_support = true,
}

vim.lsp.enable("lua_ls")
