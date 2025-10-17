vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = {
    '.git',
  },
  single_file_support = true,
}

vim.lsp.enable("bashls")
