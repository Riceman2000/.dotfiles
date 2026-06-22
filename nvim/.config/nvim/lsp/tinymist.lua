vim.lsp.config.tinymist = {
  cmd = { "tinymist", "lsp" },
  filetypes = { "typst" },
  root_markers = {
    '.git',
  },
  single_file_support = true,
  on_attach = function(client, bufnr)
    -- TODO: Implement some hotkeys and commands if I need them
  end,
}
