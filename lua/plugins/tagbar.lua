return {
  "majutsushi/tagbar",
  cmd = {
    "TagbarToggle"
  },
  config = function ()
    vim.g.tagbar_autofocus = 1
    vim.g.tagbar_sort = 0
    vim.g.tagbar_compact = 2
    vim.g.tagbar_indent = 1
  end
}
