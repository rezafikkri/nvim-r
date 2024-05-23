-- define common options
local opts = function (desc)
  return {
    noremap = true,       -- non-recursive
    silent = true,        -- do not show message
    desc = desc           -- keymap description
  }
end

-- Shorten function name
local keymap = vim.keymap.set

-- change leader key to <Space>
vim.g.mapleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts('Move the cursor to left window'))
keymap('n', '<C-j>', '<C-w>j', opts('Move the cursor to bottom window'))
keymap('n', '<C-k>', '<C-w>k', opts('Move the cursor to top window'))
keymap('n', '<C-l>', '<C-w>l', opts('Move the cursor to right window'))

-- Resize with arrows
-- delta: 2 lines
keymap('n', '<C-Up>', ':resize -2<CR>', opts('Decrease window size (horizontal)'))
keymap('n', '<C-Down>', ':resize +2<CR>', opts('Increase window size (horizontal)'))
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts('Descrease window size (vertical)'))
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts('Increase window size (vertical)'))

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts('Move text to down'))
keymap("n", "<A-k>", ":m .-2<CR>==", opts('Move text to up'))

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap('v', '<Tab>', '>', opts('Increase indentation repeatedly'))
keymap('v', '<S-Tab>', '<', opts('Decrease indentation repeatedly'))

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts('Move text to down'))
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts('Move text to up'))
