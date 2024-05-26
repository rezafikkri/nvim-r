-- This plugin used for keybindings in neovim, 
-- it displays a popup with possible keybindings of the command you started typing. 
return {
  "folke/which-key.nvim",
  lazy = true,
  keys = { "<leader>" },
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")
    -- Setup which-key
    which_key.setup {
      plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
      },
      -- Disabled by default for Telescope
      disable = {
        filetypes = { "TelescopePrompt" },
      },
    }

    -- Register mappings
    which_key.register({
      w = { "<cmd>w!<cr>", "󰆓 Save" },
      q = { "<cmd>q!<cr>", "󰿅 Quit" },
      h = { "<cmd>nohlsearch<cr>", "󱪿 No Highlight" },

      l = {
        name = "  LSP",
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Installer Info" },
        j = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      },
    }, { prefix = "<leader>" })
  end
}
