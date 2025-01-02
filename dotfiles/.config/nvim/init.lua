vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = false
vim.cmd.colorscheme("vim")
vim.opt.list = true
vim.opt.spelllang = "en_gb"
vim.g.have_nerd_font = true
vim.opt.colorcolumn = "80,100"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.listchars:append({
	tab = "| ",
	multispace = space,
	lead = space,
	trail = "·",
	nbsp = "␣",
})

require("lspconfig").ruff.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").terraform_lsp.setup({})

require("keymaps")
require("autocmds")

-- Set options where there is not yet a Lua API

-- local settings = {
--   'set colorcolumn=80,100',
-- }
-- for _, setting in ipairs(settings) do vim.cmd(setting) end
