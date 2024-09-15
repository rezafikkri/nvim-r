return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-phpunit",
  },
  config = function ()
    require("neotest-phpunit")({
      filter_dirs = { "vendor" },
    })
    require("neotest").setup({
      adapters = {
        require("neotest-phpunit"),
      },
    })
  end,
  keys = {
    { "<leader>t","",desc="Test"},
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>ta", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
    { "<Leader>ty", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<Leader>tp", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<Leader>ts", function() require("neotest").run.stop() end, desc = "Stop" },
  },
}
