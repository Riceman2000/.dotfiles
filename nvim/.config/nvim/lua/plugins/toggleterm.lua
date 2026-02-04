return {
  'akinsho/toggleterm.nvim',
  opts = function()
    require('toggleterm').setup {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return vim.fn.winheight(0) * 0.8
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      highlights = {
        NormalFloat = {
          link = 'NormalFloat',
        },
        FloatBorder = {
          link = 'FloatBorder',
        },
      },
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      direction = 'float',
      close_on_exit = true,   -- close the terminal window when the process exits
    }

    -- Toggleterm keymaps
    local nmap = function(keys, func, desc)
      if desc then
        desc = desc .. ' [Term N]'
      end
      vim.keymap.set('n', keys, func, { desc = desc })
    end

    local term = require('toggleterm')

    -- Opening terms
    nmap('<leader>tf', ':ToggleTerm direction=float<CR>', "[T]erm [F]loat")
    nmap('<leader>th', ':2ToggleTerm direction=horizontal<CR>', "[T]erm [H]orizontal split")
    nmap('<leader>tv', ':2ToggleTerm direction=vertical<CR>', "[T]erm [V]ertical split")
  end,
}
