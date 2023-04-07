return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- Trailing whitespace removal
  { "cappyzawa/trim.nvim", lazy = false, opts = {} },

  -- Smart Column 80
  -- { "m4xshen/smartcolumn.nvim", lazy = false, opts = {} },

  -- Color Scheme
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          transparent = false,
        },
      })
    end,
  },
}
