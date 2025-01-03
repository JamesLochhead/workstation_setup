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

-- Format code on save

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local current_file_abs_path = vim.fn.expand("%:p")
		local fmt_mappings = {
			["lua"] = ":silent !stylua " .. current_file_abs_path,
			["go"] = ":silent !go fmt " .. current_file_abs_path,
			["sh"] = ":silent !shfmt -w " .. current_file_abs_path,
			["markdown"] = ":silent !prettier -w " .. current_file_abs_path,
		}
		if fmt_mappings[vim.bo.filetype] ~= nil then
			vim.cmd(fmt_mappings[vim.bo.filetype])
		end
	end,
})
