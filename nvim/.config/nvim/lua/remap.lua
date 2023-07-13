local nmap = function(keys, func, desc)
  if desc then
    desc = desc .. ' [Remap N]'
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

local vmap = function(keys, func, desc)
  if desc then
    desc = desc .. ' [Remap V]'
  end

  vim.keymap.set('v', keys, func, { desc = desc })
end

-- See `:help vim.keymap.set()`

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Format
nmap('<leader>f', vim.lsp.buf.format, '[F]ormat')

-- Open netrw
nmap('<leader>pv', vim.cmd.Ex, "Open netrw")

-- Move chunks while in visual mode
vmap('J', ":m '>+1<CR>gv=gv", nil) -- Move chunk DOWN
vmap('K', ":m '<-2<CR>gv=gv", nil) -- Move chunk UP

-- Half page scrolling keep cursor centered
nmap("<C-d>", "<C-d>zz", nil)
nmap("<C-u>", "<C-u>zz", nil)

-- Keep search terms centered on the screen
nmap("n", "nzzzv", nil)
nmap("N", "Nzzzv", nil)

-- Ctrl-p will paste the primary buffer over selected text and
-- keep the original buffer unchanged
vim.keymap.set("x", "<C-p>", [["_dP]])

-- Leader-y will coppy to the '+' register which is the system
-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard [Remap NV]" })

-- All my homies hate capital Q
nmap("Q", "<nop>", nil)

-- Find and replace the word under the cursor
nmap("<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "[S]earch and [R]eplace current word")
