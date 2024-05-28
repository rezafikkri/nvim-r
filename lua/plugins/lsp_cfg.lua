local icons = {
  Error = "",
  Warning = "",
  Information = "",
  Hint = "󰌶",
}

return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = {"BufReadPre", "BufNewFile"},
    cmd = {
      "LspInfo",
      "LspInstall",
      "LspUninstall",
    },
    config = function()
      local sign = function(opts)
        -- See :help sign_define()
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({name = 'DiagnosticSignError', text = icons.Error})
      sign({name = 'DiagnosticSignWarn', text = icons.Warning})
      sign({name = 'DiagnosticSignHint', text = icons.Hint})
      sign({name = 'DiagnosticSignInfo', text = icons.Information})

      -- See :help vim.diagnostic.config()
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      })

      -- Add border to lspconfig ui (ex. when run :LspInfo command)
      require("lspconfig.ui.windows").default_options.border = "rounded"

      require("mason-lspconfig").setup({
        -- A list of servers to automatically install if they're not already installed
        ensure_installed = { 'lua_ls' },
      })

      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          local opts = {
            capabilities = capabilities,
          }

          local require_ok, conf_opts = pcall(require, "lsp.settings." .. server_name)
          if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
          end

          require("lspconfig")[server_name].setup(opts)
        end,
      }
    end
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
          },
        },
      })
    end
  },
}
