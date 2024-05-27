return {
  'nvim-tree/nvim-web-devicons', -- for file type icons
  lazy = true,
  config = function ()
    require("nvim-web-devicons").setup {}
  end
}
