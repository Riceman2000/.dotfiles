return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',           --  theme is doom and hyper default is hyper
      disable_move = false,      --  default is false disable move keymap for hyper
      shortcut_type = 'letter',  --  shorcut type 'letter' or 'number'
      change_to_vcs_root = true, -- default is false,for open file in hyper mru. it will change to the root of vcs

      -- config used for theme
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = 'Update', group = '@property', action = 'Lazy update', key = 'U' },
          {
            icon = '',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Number',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = '',
            icon_hl = '@variable',
            desc = 'Git',
            group = 'Label',
            action = 'Telescope git_files',
            key = 'g',
          },
          {
            icon = '',
            icon_hl = '@variable',
            desc = 'Grep',
            group = 'Number',
            action = 'Telescope live_grep',
            key = 'f',
          },
          {
            icon = '',
            icon_hl = '@variable',
            desc = 'Recents',
            group = '@property',
            action = 'Telescope oldfiles',
            key = 'o',
          },
        },
        footer = { [[健全なる魂は、健全なる精神と、健全なる肉体に宿る.]] },
      },

      hide = {
        statusline = false, -- hide statusline default is true
        tabline = true,     -- hide the tabline
        winbar = true       -- hide winbar
      },
      preview = {
        -- command     -- preview command
        -- file_path   -- preview file path
        -- file_height -- preview file height
        -- file_width  -- preview file width
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
