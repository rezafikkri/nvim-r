return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects'},
  build = ":TSUpdate",
  lazy = true,
  cmd = {
    "TSInstall",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
    "TSInstallInfo",
    "TSInstallSync",
    "TSInstallFromGrammar",
  },
  event = { "BufRead", "VeryLazy" },
  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "php", "css" },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end
}
