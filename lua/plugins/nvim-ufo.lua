return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function ()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup {
          relculright = true,
          segments = {
            {text = {"%s"}, click = "v:lua.ScSa"},
            {text = {builtin.foldfunc, " "}, click = "v:lua.ScFa"},
            {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"},
          },
        }
      end
    },
  },
  event = "BufReadPost",
  config = function ()
    vim.opt.foldcolumn = '1' -- '0' is not bad
    vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true

    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    require('ufo').setup({
      provider_selector = function()
        return {'treesitter', 'indent'}
      end
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "NvimTree",
        "lazy",
        "mason",
        "neotest-summary",
        "neotest-output-panel"
      },
      callback = function()
        require("ufo").detach()
        vim.opt.foldenable = false
        vim.opt.signcolumn = 'no'
      end,
    })
  end
}
