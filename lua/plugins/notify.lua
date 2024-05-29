return {
  'rcarriga/nvim-notify',
  event = "VeryLazy",
  timeout = 3000,
  config = function ()
    local notify = require("notify")
    vim.notify = notify
  end
}
