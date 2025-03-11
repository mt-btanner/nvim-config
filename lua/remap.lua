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
vim.keymap.set("n", "<leader>lf", "<cmd>silent !prettier --write '%'<CR>", { desc = "Format buffer", remap = true })
vim.keymap.set(
	"n",
	"<leader>rc",
	"<cmd>10new | exe 'terminal rubocop ' .. shellescape(expand('#'), 1)<CR>",
	{ desc = "Run rubocop on current file" }
)
vim.keymap.set("n", "<leader>ra", "<cmd>! rubocop -a %<CR>", { desc = "Rubocop safe autocorrect current file" })
vim.keymap.set(
	"n",
	"<leader>rs",
	"<cmd>tabnew | exe 'terminal bundle exec rspec ' .. shellescape(expand('#'), 1)<CR>",
	{ desc = "Run rspec on current file" }
)

-- LSP
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { desc = "Show line diagnostics", remap = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition", remap = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references", remap = true })
vim.keymap.set(
	"n",
	"<leader>ar",
	"<cmd>lua vim.lsp.buf.rename()<CR>",
	{ desc = "Rename all occurrences", remap = true }
)
vim.keymap.set("i", "<C-n>", "<C-x><C-o>", { desc = "Trigger LSP completion" })

-- Split windows
vim.keymap.set("n", "<leader>-", "<C-W>s<C-W>j", { desc = "Split window below", remap = true })
vim.keymap.set("n", "+", "<C-W>+", { desc = "Increase window height", remap = true })
vim.keymap.set("n", "-", "<C-W>-", { desc = "Decrease window height", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v<C-W>l", { desc = "Split window right", remap = true })
vim.keymap.set(
	"n",
	"<leader>vt",
	"<cmd> vsplit | terminal<CR>",
	{ desc = "Open terminal in right split", remap = true }
)

-- Switch windows
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Switch to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Switch to below window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Switch to above window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Switch to right window", remap = true })

-- GrugFar
vim.keymap.set("n", "<leader>rg", "<cmd>GrugFar<CR>", { desc = "Grug far!!", remap = true })

-- Persistence
vim.keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Load session for pwd", remap = true })
vim.keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "Choose session to reload", remap = true })
vim.keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Load last session", remap = true })
vim.keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Don't save this session", remap = true })

-- Fugitive
vim.keymap.set("n", "<leader>gs", "<cmd>:G<CR>", { desc = "Open git status", remap = true })

-- Copilot
vim.keymap.set("n", "<leader>ce", "<cmd>:Copilot enable<CR>", { desc = "Enable Copilot", remap = true })
vim.keymap.set("n", "<leader>cd", "<cmd>:Copilot disable<CR>", { desc = "Disable Copilot", remap = true })
