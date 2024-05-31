return {
  "akinsho/toggleterm.nvim",
	cmd = {
		"ToggleTerm",
		"TermExec",
		"ToggleTermToggleAll",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
	},
  config = function ()
    require("toggleterm").setup {
      direction = "float",
      open_mapping = [[<c-\>]],
      float_opts = {
        border = "curved",
        height = 30,
      },
    }
  end
}
