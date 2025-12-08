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

vim.lsp.enable("gopls")
vim.lsp.enable("ruff")
vim.lsp.enable("terraform_lsp")
vim.lsp.enable("golangci_lint_ls")

require("keymaps")
require("autocmds")
