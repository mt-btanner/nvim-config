-- General
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, { desc = "Exit to containing directory", remap = true })
vim.keymap.set("n", "<leader>t", vim.cmd.tabedit, { desc = "New Tab", remap = true })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "Close Tab", remap = true })
vim.keymap.set("n", "<Left>", "<Nop>", { desc = "Disable left arrow", remap = true })
vim.keymap.set("n", "<Right>", "<Nop>", { desc = "Disable right arrow", remap = true })
vim.keymap.set("n", "<Up>", "<Nop>", { desc = "Disable up arrow", remap = true })
vim.keymap.set("n", "<Down>", "<Nop>", { desc = "Disable down arrow", remap = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight", remap = true })

-- Linting
vim.keymap.set(
	"n",
	"<leader>lf",
	"<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000, filter = function(client) return client.name ~= 'tsserver' end })<CR>",
	{ desc = "Format buffer", remap = true }
)
vim.keymap.set(
	"n",
	"<leader>rc", "<cmd>10new | exe 'terminal rubocop ' .. shellescape(expand('#'), 1)<CR>",
	{ desc = "Run rubocop on current file" }
)
vim.keymap.set(
	"n",
	"<leader>rs", "<cmd>tabnew | exe 'terminal bundle exec rspec ' .. shellescape(expand('#'), 1)<CR>",
	{ desc = "Run rspec on current file" }
)
vim.keymap.set("n", "<leader>rca", "<cmd>! rubocop -a %<CR>", { desc = "Rubocop safe autocorrect current file" })

-- LSP
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { desc = "Show line diagnostics", remap = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition", remap = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references", remap = true })
vim.keymap.set("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename all occurrences", remap = true })

-- Split windows
vim.keymap.set("n", "<leader>-", "<C-W>s<C-W>j", { desc = "Split window below", remap = true })
vim.keymap.set("n", "+", "<C-W>+", { desc = "Increase window height", remap = true })
vim.keymap.set("n", "-", "<C-W>-", { desc = "Decrease window height", remap = true })
vim.keymap.set("n", "<leader>/", "<C-W>v<C-W>l", { desc = "Split window right", remap = true })

-- Switch windows
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Switch to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Switch to below window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Switch to above window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Switch to right window", remap = true })
