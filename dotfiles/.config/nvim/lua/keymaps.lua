-- Ctrl + A

vim.api.nvim_set_keymap("i", "<C-A>", "<C-O>^", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-A>", "^", { noremap = true })

-- Ctrl + E

vim.api.nvim_set_keymap("i", "<C-E>", "<C-O>$", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-E>", "$", { noremap = true })

-- Arrows in insert mode

vim.api.nvim_set_keymap("i", "<Left>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Right>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Up>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Down>", "<Down>", { noremap = true })

-- Alt (Opt) + Arrows in insert mode
-- On MacOS, requires iTerm2 to send Esc+ as Meta

vim.api.nvim_set_keymap("i", "<M-Left>", "<C-O>b", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-Right>", "<C-O>w", { noremap = true })

-- Alt (Opt) + Arrows in normal mode
-- On MacOS, requires iTerm2 to send Esc+ as Meta

vim.api.nvim_set_keymap("n", "<M-Left>", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-Right>", "w", { noremap = true })

-- Toggle spell check

vim.api.nvim_set_keymap("n", "<Leader>s", ":set spell!<cr>", { noremap = true })

-- Buffers

vim.api.nvim_set_keymap("n", "<Leader>b", ":buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<tab>", ":bn<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-tab>", ":bp<cr>", { noremap = true })

-- Cursor column

vim.api.nvim_set_keymap("n", "<Leader>k", ":set cursorcolumn!<cr>", { noremap = true })

-- Yank

vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>yy", '"+yy', { noremap = true })

-- Paste

vim.api.nvim_set_keymap("v", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true })

-- Kickstart

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
