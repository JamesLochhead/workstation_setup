-- Format code on save

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local current_file_name = vim.fn.expand("%:p")
		vim.cmd(":silent !stylua " .. current_file_name)
	end,
})
