local lspconfig = require("lspconfig")
local cmp = require("cmp")

require("project_nvim").setup({})

-- Completion

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview",
	},
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "async_path" },
	}, { name = "buffer" }),
	formatting = {
		format = require("lspkind").cmp_format({
			max_width = 50,
			ellipsis_chat = "...",
		}),
	},
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
	}, {
		{ name = "buffer" },
	}),
})

-- Git integration

require("cmp_git").setup()
require("neogit").setup({})
require("gitsigns").setup()

-- LSP

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				useLibraryCodeForTypes = false,
			},
		},
	},
})
lspconfig.lua_ls.setup({
	on_init = function(client)
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = { Lua = {} },
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
})

lspconfig.html.setup({
	capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
	filetypes = { "css", "html", "html", "template" },
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
})

-- Language support

require("swenv").setup({
	post_set_venv = function()
		vim.cmd.LspRestart()
	end,
})

require("formatter").setup({
	filetype = {
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},
		lua = { require("formatter.filetypes.lua").stylua },
		c = { require("formatter.filetypes.c").clangformat },
		go = { require("formatter.filetypes.go").gofmt },
		typescript = { require("formatter.filetypes.typescript").prettier },
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"python",
		"javascript",
		"html",
		"css",
		"toml",
		"bash",
		"c",
		"go",
		"diff",
		"dockerfile",
		"gitignore",
		"json",
		"json5",
		"make",
		"ssh_config",
		"todotxt",
		"yaml",
	},
	ignore_install = {},
	auto_install = true,
	sync_install = false,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	modules = {},
	indent = { enable = true },
})

-- Information lines/tabs

require("lualine").setup({
	sections = {
		lualine_a = { "swenv" },
	},
	theme = "gruvbox",
})

require("bufferline").setup({
	options = { diagnostics = "nvim_lsp" },
})

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})

require("nvim-cursorline").setup({
	cursorline = {
		enable = true,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	},
})

-- Editing

require("nvim-autopairs").setup({})
require("auto-save").setup({})

-- Starting up

require("telescope").load_extension("import")
require("telescope").setup({
	extension = {
		import = {
			insert_at_top = true,
		},
	},
})

require("dashboard").setup({
	config = {
		"NeoVim",
	},
})

require("Comment").setup()
