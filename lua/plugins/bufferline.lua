return {
  'akinsho/bufferline.nvim',
  dependencies = { 'moll/vim-bbye' },
  event = { "BufRead", "BufNewFile" },
  config = function ()
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "NvimTreeNormal",
            padding = 1,
          },
        },
      },
    }
  end
}
