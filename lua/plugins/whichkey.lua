-- This plugin used for keybindings in neovim, 
-- it displays a popup with possible keybindings of the command you started typing. 
return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = { 'echasnovski/mini.icons', version = false },
  config = function()
    function _lazygit_toggle()
      local Terminal  = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
      lazygit:toggle()
    end

    local which_key = require("which-key")
    -- Setup which-key
    which_key.setup {
      preset = "modern",
      delay = 400,
      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = false,
      },
      disable = {
        ft = { "TelescopePrompt" },
      },
    }

    which_key.add({
      { "<leader>/",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Comment line",
        icon = "󰆄",
      },
      {
        "<leader>/",
        function ()
          local api = require('Comment.api')
          local esc = vim.api.nvim_replace_termcodes(
            '<ESC>', true, false, true
          )
          vim.api.nvim_feedkeys(esc, 'nx', false)
          api.toggle.linewise(vim.fn.visualmode())
        end,
        desc = "Commet Block",
        icon = "󰆈",
        mode = "v",
      },
      { "<leader>w", "<cmd>w<cr>", desc = "Save", icon = "󰆓" },
      { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
      { "<leader>h", "<cmd>nohlsearch<cr>", desc = "No Highlight", icon = "󱪿" },
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", icon = "󰙅" },
      { "<leader>c", "<cmd>Bdelete<cr>", desc = "Close current buffer", icon = "󰛉" },
      {
        "<leader>n",
        "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<cr>",
        desc = "Close all notifications",
        icon = "󱒼",
      },
      { "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", desc = "Lazygit", icon = "" },
      { "<leader>r", "<cmd>lua require('gitsigns').refresh()<cr>", desc = "Refresh Gitsigns", icon = "" },
      {
        { "<leader>b", group = "Buffers", icon = " " },
        { "<leader>ba", ":bufdo :Bdelete<cr>", desc = "Close all buffers" },
        { "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move current buffer to next" },
        { "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move current buffer to prev" },
      },
      {
        { "<leader>l", group = "LSP", icon = "" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
        { "<leader>lI", "<cmd>Mason<cr>", desc = "Installer Info" },
        { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
        { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
        { "<leader>lt", "<cmd>DiagnosticsToggle<cr>", desc = "Toggle Diagnostic" },
        {
          "<leader>ld",
          "<cmd>Telescope diagnostics bufnr=0<cr>",
          desc = "Document Diagnostics",
        },
        {
          "<leader>lw",
          "<cmd>Telescope diagnostics<cr>",
          desc = "Workspace Diagnostics",
        },
      },
      {
        { "<leader>z", group = "Plugins(Lazy)" },
        { "<leader>zh", "<cmd>Lazy home<cr>", desc = "List" },
        { "<leader>zi", "<cmd>Lazy install<cr>", desc = "Install" },
        { "<leader>zs", "<cmd>Lazy sync<cr>", desc = "Sync" },
        { "<leader>zx", "<cmd>Lazy clean<cr>", desc = "Clean" },
        { "<leader>zu", "<cmd>Lazy update<cr>", desc = "Update" },
        { "<leader>zp", "<cmd>Lazy profile<cr>", desc = "Profile" },
        { "<leader>zl", "<cmd>Lazy log<cr>", desc = "Log" },
        { "<leader>zd", "<cmd>Lazy debug<cr>", desc = "Debug" },
      },
      {
        { "<leader>f", group = "Telescope" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grap" },
      },
    })
  end
}
