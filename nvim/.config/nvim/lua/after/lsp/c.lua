vim.lsp.config.clangd = {
  cmd = { "clangd" },
  filetypes = { "c" },
  root_markers = {
    '.git',
  },
  single_file_support = true,
  init_options = {
    -- Use c23 as a fallback so the lsp
    -- knows about true, false, etc - see:
    -- https://xnacly.me/posts/2025/clangd-lsp/
    fallbackFlags = { '--std=c23' }
  },
}

vim.lsp.enable("clangd")
