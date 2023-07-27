return {
  'saecki/crates.nvim',
  event = { "BufRead Cargo.toml" },
  requires = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    require('crates').setup()

    -- Crates keymaps
    local nmap = function(keys, func, desc)
      if desc then
        desc = desc .. ' [Crates N]'
      end

      vim.keymap.set('n', keys, func, { desc = desc })
    end

    local vmap = function(keys, func, desc)
      if desc then
        desc = desc .. ' [Crates V]'
      end

      vim.keymap.set('v', keys, func, { desc = desc })
    end

    local crates = require('crates')

    nmap('<leader>ct', crates.toggle, "[C]rates [T]oggle")
    nmap('<leader>cr', crates.reload, "[C]rates [R]eload")

    nmap('<leader>cv', crates.show_versions_popup, "[C]rates [V]ersion popup")
    nmap('<leader>cf', crates.show_features_popup, "[C]rates [F]eatures popup")
    nmap('<leader>cd', crates.show_dependencies_popup, "[C]rates [D]ependencies popup")

    nmap('<leader>cu', crates.update_crate, "[C]rates [U]pdate")
    vmap('<leader>cu', crates.update_crates, "[C]rates [U]pdate selected")
    nmap('<leader>ca', crates.update_all_crates, "[C]rates update [A]ll")
    nmap('<leader>cU', crates.upgrade_crate, "[C]rates [U]pgrade")
    vmap('<leader>cU', crates.upgrade_crates, "[C]rates [U]pgrade selected")
    nmap('<leader>cA', crates.upgrade_all_crates, "[C]rates upgrade [A]ll")

    nmap('<leader>cH', crates.open_homepage, "[C]rates open [H]omepage")
    nmap('<leader>cR', crates.open_repository, "[C]rates open [R]epo")
    nmap('<leader>cD', crates.open_documentation, "[C]rates open [D]ocs")
    nmap('<leader>cC', crates.open_crates_io, "[C]rates open [C]rates.io")
  end,
}
