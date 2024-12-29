vim.g.mapleader = ' '
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = false
vim.cmd.colorscheme 'vim'
vim.opt.list = true

vim.opt.listchars:append {
	tab = "| ",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}

vim.cmd([[match TrailingWhitespace /\s\+$/]])

vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.listchars.trail = nil
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
	end
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.listchars.trail = space
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
	end
})

vim.api.nvim_set_keymap(
  "i",
  "<C-A>",
  "<C-O>^",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<C-E>",
  "<C-O>$",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<C-A>",
  "^",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<C-E>",
  "$",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<Left>",
  "<Left>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<Right>",
  "<Right>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<Up>",
  "<Up>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<Down>",
  "<Down>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<M-Left>",
  "<C-O>b",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "i",
  "<M-Right>",
  "<C-O>w",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<M-Left>",
  "b",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<M-Right>",
  "w",
  { noremap = true }
)

require'lspconfig'.ruff.setup{}
