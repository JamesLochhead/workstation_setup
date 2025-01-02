-- Highlight trailing whitespace

vim.cmd([[match TrailingWhitespace /\s\+$/]])

vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.listchars.trail = nil
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.listchars.trail = space
		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
	end,
})
