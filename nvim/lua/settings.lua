local g = vim.g
local o = vim.o

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.mapleader = " "
g.maplocalleader = " "

o.number = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitbelow = true
o.background = "dark"
o.updatetime = 300
o.incsearch = false
vim.wo.signcolumn = "yes"

vim.cmd([[colorscheme gruvbox]])
