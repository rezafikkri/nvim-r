local icons = {
  ui = {
    BoldLineLeft = "▎",
    Triangle = "󰐊",
  },
}

return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  enabled = vim.fn.executable("git") == 1,
  config = function ()
    require('gitsigns').setup {
      attach_to_untracked = true,
      signs = {
        add = { text = icons.ui.BoldLineLeft },
        change = { text = icons.ui.BoldLineLeft },
        delete = { text = icons.ui.Triangle },
        topdelete = { text = icons.ui.Triangle },
        changedelete = { text = icons.ui.BoldLineLeft },
      },
    }
  end
}
