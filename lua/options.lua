vim.opt.clipboard = 'unnamedplus'                       -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}   -- for completion (cmp)
vim.opt.fileencoding = "utf-8"                          -- the encoding written to a file
vim.opt.mouse = 'a'                                     -- allow the mouse to be used in Nvim
vim.opt.timeoutlen = 300                                -- Length of time to wait for a mapped sequence
vim.opt.undofile = true                                 -- Enable persistent undo
vim.opt.swapfile = false                                -- Disable use of swapfile for the buffer
vim.opt.writebackup = false                             -- Disable making a backup before overwriting a file
vim.opt.signcolumn = 'yes'                              -- show sign column
vim.opt.ruler = false                                   -- Disable ruler (line and column number of the cursor position in cmdline)
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI config
vim.opt.number = true                                   -- set numbered lines
vim.opt.relativenumber = false                          -- set relative numbered lines
vim.opt.numberwidth = 4                                 -- set number column width to 2 {default 4}
vim.opt.cursorline = true                               -- highlight cursor line underneath the cursor horizontally
vim.opt.laststatus = 3                                  -- enable global statusline
vim.opt.statusline = " "                                -- set default statusline is empty
vim.opt.showmode = false                                -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.splitbelow = true                               -- force all horizontal splits to go below current window
vim.opt.splitright = true                               -- force all vertical splits to go to the right of current window
vim.opt.wrap = true                                     -- display lines as one long line

-- Search
vim.opt.hlsearch = true                                 -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                               -- ignore case in searches by default
vim.opt.smartcase = true                                -- but make it case sensitive if an uppercase is entered
