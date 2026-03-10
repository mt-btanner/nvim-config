require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.config("lua_ls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("stylelint_lsp", {})
vim.lsp.config("rubocop", {
	cmd = { "bundle", "exec", "rubocop", "--lsp" },
	root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
})
