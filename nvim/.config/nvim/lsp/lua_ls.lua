return {
  cmd = { "lua-language-server", "--stdio" },
  filetypes = { "lua" },
  root_markers = {
    '.git',
  },
  single_file_support = true,
  settings = {
    Lua = {
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),

          -- Hyprland stubs, NixOS and non-insane OS locations generally
          "/run/current-system/sw/share/hypr/stubs",
          "/usr/share/hypr/stubs",
        }
      }
    }
  }
}
