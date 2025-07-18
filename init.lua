require("remap")
require("config.lazy")
require("lsp")

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.g.have_nerd_font = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.timeoutlen = 500
vim.opt.tabstop = 2
vim.opt.termguicolors = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.splitright = true

require("oil").setup({
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "ruby", "typescript" },
	sync_install = false,
	auto_install = true,
})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

require("mini.pairs").setup()
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true,
	},
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = false,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "searchcount", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

require("lint").linters_by_ft = {
	ruby = { "rubocop" },
	javascript = { "eslint" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
	javascriptreact = { "eslint" },
}

require("neotest").setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "yarn jest --",
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-rspec")({
			command = "bundle exec rspec",
		}),
		require("neotest-playwright").adapter({
			options = {
				persist_project_selection = true,
				enable_dynamic_test_discovery = true,
			},
		}),
	},
})

require("conform").setup({
	formatters = {
		prettier = {
			require_cwd = true,
			cwd = require("conform.util").root_file({
				".prettierrc",
				".prettierrc.json",
				".prettierrc.yml",
				".prettierrc.yaml",
				".prettierrc.json5",
				".prettierrc.js",
				".prettierrc.cjs",
				".prettierrc.mjs",
				".prettierrc.toml",
				"prettier.config.js",
				"prettier.config.cjs",
				"prettier.config.mjs",
			}),
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		ruby = { "rubocop" },
	},
	format_on_save = {
		timeout_ms = 1500,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.cmd("colorscheme tokyonight")
