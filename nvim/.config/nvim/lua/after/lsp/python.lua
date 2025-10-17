vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = true,
          pytestParameters = true,
        },
      }
    }
  }
}

vim.lsp.enable("pyright")

-- Manim render keybind
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.config.filetypes and vim.tbl_contains(client.config.filetypes, "python") then
      -- Defer the manim check slightly to allow buffer to load
      vim.defer_fn(function()
        if has_manim_dependency() then
          vim.keymap.set('n', "<leader>mm", render_scene, {
            desc = "Manim: render scene",
            buffer = args.buf
          })
        end
      end, 100)
    end
  end,
})

-- Check if manim is imported in current buffer or project
function has_manim_dependency()
  -- Check current buffer for manim import
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(lines) do
    if line:match("^%s*import%s+manim") or line:match("^%s*from%s+manim") then
      return true
    end
  end

  -- Check for manim in requirements.txt or pyproject.toml
  local root = vim.fs.root(0, { '.git', 'pyproject.toml', 'requirements.txt' })
  if root then
    local req_file = root .. '/requirements.txt'
    if vim.fn.filereadable(req_file) == 1 then
      local content = vim.fn.readfile(req_file)
      for _, line in ipairs(content) do
        if line:match("manim") then
          return true
        end
      end
    end

    local pyproject = root .. '/pyproject.toml'
    if vim.fn.filereadable(pyproject) == 1 then
      local content = vim.fn.readfile(pyproject)
      for _, line in ipairs(content) do
        if line:match("manim") then
          return true
        end
      end
    end
  end

  return false
end

-- Get the current class to pass to the manim renderer based on cursor pos
function get_class_name()
  local node = vim.treesitter.get_node()
  while node do
    if node:type() == "class_definition" then
      local name_node = node:field("name")[1]
      if name_node then
        local class_name = vim.treesitter.get_node_text(name_node, 0)
        return class_name
      end
    end
    node = node:parent()
  end
  return nil
end

-- Get the root dir of the LSP so we can play media dir at project root
function get_lsp_root_dir()
  local workspace_folders = vim.lsp.buf.list_workspace_folders()
  if workspace_folders and #workspace_folders > 0 then
    -- The first workspace folder is typically the LSP root directory
    return workspace_folders[1]
  else
    -- Fallback to current working directory if no LSP workspace folders are found
    return vim.fn.getcwd()
  end
end

-- Render only the scene the cursor is currently on
function render_scene()
  local class_name = get_class_name()
  if not class_name then
    print("No class name found at cursor!")
    return
  end

  local media_dir = get_lsp_root_dir() .. '/media'
  local file_path = vim.fn.expand('%:p')
  local file_name = vim.fn.expand('%:t:r')
  local video_path = media_dir .. '/videos/' .. file_name .. '/480p15/' .. class_name .. '.mp4'

  local manim_cmd = string.format("manim -ql '%s' '%s' --media_dir '%s'", file_path, class_name, media_dir)
  local mpv_cmd = string.format("mpv '%s'", video_path)
  local cmd = manim_cmd .. " && " .. mpv_cmd

  require("toggleterm.terminal").Terminal:new({ cmd = cmd }):toggle()
end
