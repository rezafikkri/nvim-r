local icons = {
  git = {
    FileDeleted = "",
    FileIgnored = "",
    FileRenamed = "",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeToggle" },
  config = function ()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
      vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
    end

    require("nvim-tree").setup {
      on_attach = my_on_attach,
      renderer = {
        highlight_git = "name",
        root_folder_label = ":t",
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          glyphs = {
            git = {
              unstaged = icons.git.FileUnstaged,
              staged = icons.git.FileStaged,
              unmerged = icons.git.FileUnmerged,
              renamed = icons.git.FileRenamed,
              untracked = icons.git.FileUntracked,
              deleted = icons.git.FileDeleted,
              ignored = icons.git.FileIgnored,
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = { enable = true },
      },
      filters = {
        custom = { "node_modules" },
      },
    }
  end
}
