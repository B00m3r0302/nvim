return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local lsp_config = require("config.lsp")
			require("mason-lspconfig").setup({
				ensure_installed = {
					"asm_lsp", "bashls", "clangd", "omnisharp", "gopls", "html", "jtdls", "tsserver", "jq_ls", "jsonls", "lua_ls", "perlls", "marksman", "nginx_language_server", "nimls", "intelephense", "powershell_es", "pyright", "solargraph", "rust_analyzer", "sqlls", "svelte", "taplo", "vimls", "lemminx", "yamlls", "dockerls",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup{
							on_attach = lsp_config.on_attach,
							capabilities = lsp_config.capabilities,
						}
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
}

