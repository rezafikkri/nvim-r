return {
  'goolord/alpha-nvim',
  event = "VimEnter",
  config = function ()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.header.val = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    }
    -- dashboard.section.header.val = {
    --   [[  _______       .__                 __________  ]],
    --   [[  \      \___  _|__| _____          \______   \ ]],
    --   [[  /   |   \  \/ /  |/     \   ______ |       _/ ]],
    --   [[ /    |    \   /|  |  Y Y  \ /_____/ |    |   \ ]],
    --   [[ \____|__  /\_/ |__|__|_|  /         |____|_  / ]],
    --   [[         \/              \/                 \/  ]],
    -- }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰭎  Find file", ":Telescope find_files <CR>"),
      dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("z", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100

        dashboard.section.footer.val = {
          "RezaFikkri" .. " " .. stats.loaded .. "/" .. stats.count .. " plugins  in " .. ms .. "ms"
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = { "AlphaReady" },
      callback = function()
        vim.cmd([[
          set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
        ]])
      end,
    })
  end
}
