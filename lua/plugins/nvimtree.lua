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
  diagnostics = {
    BoldError = "",
		BoldWarning = "",
		BoldInformation = "",
    BoldHint = "",
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  cmd = { 'NvimTreeToggle' },
  config = function ()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup {
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
        custom = { "node_modules", "\\.git" },
        exclude = { ".gitignore" },
      },
    }
  end
}
