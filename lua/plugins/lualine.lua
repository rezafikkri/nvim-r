local icons = {
  git = {
		LineAdded = "",
		LineModified = "",
		LineRemoved = "",
  },
  ui = {
    Gear = "",
    Tab = "󰌒",
  },
  diagnostics = {
    BoldError = "",
		BoldWarning = "",
		BoldInformation = "",
    BoldHint = "",
  },
}

local lsp_info = {
  function ()
    local buf_clients = vim.lsp.get_clients { bufnr = 0 }
    -- if none lsp active
    if next(buf_clients) == nil then
      return "LSP Inactive"
    end

    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
      table.insert(buf_client_names, client.name)
    end

    return "[" .. table.concat(buf_client_names, ", ") .. "]"
  end,
}

-- Tab info
local spaces = {
  function()
    local shiftwidth = vim.fn.shiftwidth()
    return icons.ui.Tab .. " " .. shiftwidth
  end,
}

-- Get diff source from gitsigns
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

-- lualine_a separator
local la_separator = { left = "" }
local is_cwd_git_repo = function ()
  local path = vim.loop.cwd() .. "/.git"
  local ok, err = vim.loop.fs_stat(path)
  if not ok then
    return false
  end
  return true
end
if not is_cwd_git_repo() then -- if cwd is not git repository
  la_separator = { left = "", right = "" }
end

return {
  'nvim-lualine/lualine.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    require("lualine").setup {
      options = {
        theme = "tokyonight",
        disabled_filetypes = { -- Filetypes to disable lualine for.
          "TelescopePrompt",
          "alpha",
          "dashboard",
          "NvimTree",
          "mason",
          "toggleterm",
          "lazy",
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = la_separator,
            fmt = function(str)
              return " " .. str
            end,
          },
        },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diff",
            source = diff_source,
            symbols = {
              added = icons.git.LineAdded .. " ",
              modified = icons.git.LineModified .. " ",
              removed = icons.git.LineRemoved .. " ",
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = {
              error = icons.diagnostics.BoldError .. " ",
              warn = icons.diagnostics.BoldWarning .. " ",
              info = icons.diagnostics.BoldInformation .. " ",
              hint = icons.diagnostics.BoldHint .. " ",
            },
          },
          lsp_info,
          spaces,
          "filetype",
        },
        lualine_z = {
          { "location", separator = { right = "" } },
        },
      },
    }
  end
}
