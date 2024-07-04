return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function ()
    require("tokyonight").setup({
      on_highlights = function(hl, c)
        -- Change current line number color
        hl.CursorLineNr = {
          bold = true,
          fg = "#6772A2"
        }
        hl.NvimTreeFolderIcon = {
          bg = c.none,
          fg = c.yellow,
        }
        hl.NvimTreeIndentMarker = {
          fg = "#3b4261",
        }
      end
    })
  end
}
