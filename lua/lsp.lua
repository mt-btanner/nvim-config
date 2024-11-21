---@type table<string, vim.lsp.ClientConfig>
local servers = {
	tsserver = {
		name = "typescript-language-server",
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
		  'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx'
	  },
		init_options = { hostInfo = "neovim" },
		root_dir = vim.fs.root(0, { "tsconfig.json", "package.json" }),
		single_file_support = true,
	},
	eslint = {
		name = "vscode-eslint-language-server",
		cmd = { "vscode-eslint-language-server", "--stdio" },
		filetypes = {
		  'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx'
	  },
		root_dir = vim.fs.root(0, { '.eslintrc.json', '.eslintrc.js', 'package.json', 'tsconfig.json', '.git' }),
		settings = {
		  validate = 'off',
      packageManager = 'npm',
      useESLintClass = false,
      codeActionOnSave = {
        enable = false,
        mode = 'all',
      },
      format = false,
      quiet = false,
      onIgnoredFiles = 'off',
      rulesCustomizations = {},
      run = 'onType',
      nodePath = vim.NIL,
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = 'separateLine',
        },
        showDocumentation = {
          enable = true,
        },
      },
		},
		handlers = {
      ['eslint/openDoc'] = function(_, result)
        if not result then
          return
        end
        vim.cmd('!open ' .. result.url)
        return {}
      end,
      ['eslint/confirmESLintExecution'] = function(_, result)
        if not result then
          return
        end
        return 4 -- approved
      end,
    },
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
        end,
    })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TS_add_missing_imports", { clear = true }),
  desc = "TS_add_missing_imports",
  pattern = { "*.ts", "*.tsx", "*.js", "*jsx" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.addMissingImports.ts" },
      },
    })
	vim.defer_fn(function()
		if vim.bo.modified then
			vim.cmd('write')
		end
	end, 100)
  end,
})
