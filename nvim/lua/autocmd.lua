local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd({ "BufWritePost" }, {
	group = "__formatter__",
	command = ":FormatWrite",
})

autocmd({ "FileType" }, {
	pattern = { "python" },
	callback = require("swenv.api").auto_venv,
})

autocmd({ "FileType" }, {
	pattern = { "html", "javascript", "template" },
	callback = function()
		vim.o.shiftwidth = 2
		vim.o.tabstop = 2
	end,
})
