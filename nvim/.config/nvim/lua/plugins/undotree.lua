return {
  'mbbill/undotree',
  config = function()
    vim.g.undotree_WindowLayout = 3
    vim.g.undotree_SetFocusWhenToggle = 1

    vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = '[U]ndoTree' })
  end
}
