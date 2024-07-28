local kind_icons = {
  Array = "",
  -- Boolean = "",
  Boolean = "󰨙 ",
  Class = "",
  Color = "",
  Codeium = "󰘦 ",
  Control = " ",
  Collapsed = " ",
  Constant = "",
  Constructor = "",
  Copilot = " ",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "󰉋",
  Function = "",
  Interface = "",
  Key = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "󰟢",
  Number = "",
  Object = "",
  Operator = "",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  TabNine = "󰏚 ",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "",
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- Sources
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },
  event = 'InsertEnter',
  config = function ()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- Use existing VS Code style snippets from a plugin (ex. rafamadriz/friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Add keymap for unlink current jumpable luasnip
    vim.api.nvim_set_keymap('i', "<C-l>", "<cmd>lua require('luasnip').unlink_current()<cr>", {
      noremap = true,
      silent = true,
      desc = "Removes current snippet from jumplist",
    })

    cmp.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      -- Set source precedence
      sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'buffer'},
        {name = 'luasnip'},
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        -- Set order from left to right
        -- kind: single letter indicating the type of completion
        -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
        -- menu: extra text for the popup menu, displayed after "word" or "abbr"
        fields = { "kind", "abbr", "menu" },

        -- customize the appearance of the completion menu
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = '[Lsp]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      },
      -- Set mapping
      mapping = cmp.mapping.preset.insert({
        ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
        ["<PageDown>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),

        -- Use <CR>(Enter) to confirm selection
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- A super tab
        -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    }
  end
}
