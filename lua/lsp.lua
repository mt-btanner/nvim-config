---@type table<string, vim.lsp.ClientConfig>
local servers = {
	tsserver = {
		name = "typescript-language-server",
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		init_options = { hostInfo = "neovim" },
		root_dir = vim.fs.root(0, { "tsconfig.json", "package.json" }),
		single_file_support = true,
	},
    -- add more servers here
}
local group = vim.api.nvim_create_augroup("UserLspStart", { clear = true })

-- set up autocmd to start server when one of their filetypes opened
for name, config in pairs(servers) do
    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = config.filetypes,
        callback = function (ev)
            vim.lsp.start(servers[name], { bufnr = ev.buf })
			vim.notify("Started LSP: " .. name)
        end,
    })
end

-- works, but leaves buffer unsaved no matter how many times you save
-- vim.api.nvim_create_autocmd("BufWriteCmd", {
--   group = vim.api.nvim_create_augroup("TS_code_actions", { clear = true }),
--   desc = "Run safe tsserver code actions on save",
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--   callback = function()
--     vim.lsp.buf.code_action({
--       apply = true,
--       context = {
--         only = { "source.removeUnusedImports.ts" },
--       },
--     })
--     vim.cmd("write")
--   end,
-- })
