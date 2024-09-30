local telescope = require("telescope.builtin")
local gitsigns = require("gitsigns")

local function map(key, bind_to)
	vim.keymap.set("n", key, bind_to, { silent = true })
end

local function mapv(key, bind_to)
	vim.keymap.set("v", key, bind_to, { silent = true })
end

local nvimTreeFocusOrToggle = function()
	local nvimTree = require("nvim-tree.api")
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_get_current_buf() })
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle()
	else
		nvimTree.tree.focus()
	end
end

map("<leader>n", nvimTreeFocusOrToggle)

map("<leader>xe", require("nvim-emmet").wrap_with_abbreviation)

map("<leader>ff", telescope.find_files)
map("<leader>fg", telescope.live_grep)
map("<leader>fb", telescope.buffers)
map("<leader>fh", telescope.help_tags)
map("<leader>i", function()
	vim.cmd([[:Telescope import]])
end)

map("<leader>e", vim.diagnostic.open_float)
map("<leader>t", vim.lsp.buf.hover)

map("<leader>c", require("neogit").open)
map("<leader>hs", gitsigns.stage_hunk)
map("<leader>hr", gitsigns.reset_hunk)
mapv("<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
mapv("<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
map("<leader>hS", gitsigns.stage_buffer)
map("<leader>hu", gitsigns.undo_stage_hunk)
map("<leader>hR", gitsigns.reset_buffer)
map("<leader>hp", gitsigns.preview_hunk)
map("<leader>hb", function()
	gitsigns.blame_line({ full = true })
end)
map("<leader>tb", gitsigns.toggle_current_line_blame)
map("<leader>hd", gitsigns.diffthis)
map("<leader>hD", function()
	gitsigns.diffthis("~")
end)
map("<leader>td", gitsigns.toggle_deleted)

map("<leader>f", function()
	vim.cmd([[:FormatWrite]])
end)

map("<leader>j", function()
	vim.cmd([[:BufferLineCycleNext]])
end)
map("<leader>k", function()
	vim.cmd([[:BufferLineCyclePrev]])
end)
