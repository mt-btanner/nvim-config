return {
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-telescope/telescope-fzf-native.nvim',
	  keys = {
		  { '<leader>ff',
		    function() require 'telescope.builtin'.find_files() end,
		    mode = 'n' },
		  { '<leader>fg',
		    function() require 'telescope.builtin'.live_grep() end,
		    mode = 'n' },
		  { '<leader>gf',
		    function() require 'telescope.builtin'.git_files() end,
		    mode = 'n' },
		  { '<leader>fk',
		    function() require 'telescope.builtin'.keymaps() end,
		    mode = 'n' },
		  { '<leader>fh',
		    function() require 'telescope.builtin'.help_tags() end,
		    mode = 'n' },
	  }
        },
	{ 'stevearc/oil.nvim',
	  ---@module 'oil'
	  ---@type oil.SetupOpts
	  opts = {},
	  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } }, },
  { 'tpope/vim-fugitive' },
}
