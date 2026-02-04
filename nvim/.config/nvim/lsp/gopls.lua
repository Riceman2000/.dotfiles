vim.lsp.config.gopls = {
  cmd = { "gopls", "serve" },
  filetypes = { "go" },
  root_markers = {
    '.git', 'go.mod',
  },
  single_file_support = true,
}
