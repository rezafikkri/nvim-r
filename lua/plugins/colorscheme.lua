return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {},
  config = function ()
    require("tokyonight").setup({
      on_highlights = function(hl, c)
        -- Change current line number color
        hl.CursorLineNr = {
          bold = true,
          fg = "#6772A2"
        }
      end
    })
  end
}
