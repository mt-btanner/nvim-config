require("remap")
require("config.lazy")
require("lsp")

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
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

require("oil").setup()
require("nvim-treesitter.configs").setup({
	ensure_installed = { "ruby", "typescript" },
	sync_install = false,
	auto_install = true,
})

vim.cmd("colorscheme gruvbox8")
