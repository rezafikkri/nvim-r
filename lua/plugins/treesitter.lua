return {
  "nvim-treesitter/nvim-treesitter",
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
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "php", "css", "blade" },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end
}
