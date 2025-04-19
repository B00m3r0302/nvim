-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.mapllocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Import plugins
		{ import = "plugins" },
	},
	install = { colorscheme = { "cyberdream" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
require("lazy").setup({{
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                        ensure_installed = { "asm", "bash", "c", "c_sharp", "comment", "cpp", "disassembly", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "html", "http", "java", "javadoc", "javascript", "jq", "jsdoc", "json", "lua", "luadoc", "lua_patterns", "markdown", "markdown_inline", "nginx", "nim", "nim_format_string", "pem", "perl", "php", "phpdoc", "powershell", "printf", "python", "pip_requirements", "ruby", "rust", "sql", "ssh_config", "superhtml", "svelte", "toml", "tsv", "typescript", "vim", "vimdoc", "xml", "yaml" },
                        sync_install = false,
                        highlight = { enable = true },
                        indent = { enable = true },
                })
        end
}})

