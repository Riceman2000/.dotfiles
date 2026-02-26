vim.lsp.config.ruff = {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  -- Pyright handles most of the actual LSP duty
  -- Ruff is just for formatting and some other automatic fixes
  settings = {
    configurationPreference = "filesystemFirst",
    organizeImports = true,
    fixAll = true,
    lint = {
      enable = false,
    },
    format = {
      enable = true,
    },
  }
}
