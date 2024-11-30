return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				mode = "n",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				mode = "n",
			},
			{
				"<leader>gf",
				function()
					require("telescope.builtin").git_files()
				end,
				mode = "n",
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				mode = "n",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				mode = "n",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	},
	{ "tpope/vim-fugitive" },
	{ "lewis6991/gitsigns.nvim" },
	{ "echasnovski/mini.pairs", version = "*" },
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			},
		},
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		extensions = { "oil" }
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			need = 0,
		},
	},
}
