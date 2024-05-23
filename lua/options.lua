vim.opt.clipboard = 'unnamedplus'                       -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}   -- for completion (cmp)
vim.opt.fileencoding = "utf-8"                          -- the encoding written to a file
vim.opt.mouse = 'a'                                     -- allow the mouse to be used in Nvim

-- UI config
vim.opt.number = true                                   -- set numbered lines
vim.opt.relativenumber = false                          -- set relative numbered lines
vim.opt.numberwidth = 4                                 -- set number column width to 2 {default 4}
vim.opt.cursorline = true                               -- highlight cursor line underneath the cursor horizontally
vim.opt.showmode = false                                -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.splitbelow = true                               -- force all horizontal splits to go below current window
vim.opt.splitright = true                               -- force all vertical splits to go to the right of current window
vim.opt.wrap = true                                     -- display lines as one long line

-- Search
vim.opt.hlsearch = true                                 -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                               -- ignore case in searches by default
vim.opt.smartcase = true                                -- but make it case sensitive if an uppercase is entered
