return {
  -- Add community plugin specification
  "AstroNvim/astrocommunity",

  -- Colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Language support
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },

  -- Data filetypes
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
}
