--  This function gets run when an LSP connects to a particular buffer.
local lz = require('lsp-zero')
lz.on_attach(function(client, bufnr)
  -- Enable inlay hints on attach if LSP supports
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>lr', vim.lsp.buf.rename, '[L]SP [R]ename')
  nmap('<leader>la', vim.lsp.buf.code_action, '[L]SP Code [A]ction')
  nmap('<leader>lh', function()
      local current_setting = vim.lsp.inlay_hint.is_enabled(bufnr)
      vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
    end,
    '[L]SP Inlay [H]ints toggle')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end)

-- Enable/configure the following language servers
-- NOTE: They will have to be installed if you want to use them
-- DO NOT configure rust-analyzer because rustaceanvim handles it later
local lc = require('lspconfig')
lc.pyright.setup({})
lc.clangd.setup({})
lc.bashls.setup({})
lc.lua_ls.setup({
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
})

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities = lz.get_capabilities()

-- [[ Configure rustaceanvim ]]
vim.g.rustaceanvim = {
  server = {
    capabilities = capabilities
  },
}
