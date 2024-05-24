-- This plugin used for keybindings in neovim, 
-- it displays a popup with possible keybindings of the command you started typing. 
return {
  "folke/which-key.nvim",
  lazy = true,
  keys = { "<leader>" },
  event = "VeryLazy",
}
