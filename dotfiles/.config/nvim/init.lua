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
vim.lsp.enable("pyright")
vim.lsp.enable("terraform_lsp")
vim.lsp.enable("golangci_lint_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")

require("claude-code").setup()
require("gitsigns").setup()

require("keymaps")
require("autocmds")

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
	end,
})
