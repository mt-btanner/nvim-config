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

require("oil").setup()

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
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
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

vim.cmd("colorscheme gruvbox8")
