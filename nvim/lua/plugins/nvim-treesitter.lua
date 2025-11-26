return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"javascript",
					"html",
					"css",
					"json",
					"tsx",
					"markdown",
					"markdown_inline",
					"c",
					"cpp",
				},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = false,
						node_decremental = "grm",
					},
				},
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		ft = { "html", "javascript", "javascriptreact", "typescriptreact" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
					["typescriptreact"] = {
						enable_close = true,
					},
				},
			})
		end,
	},
}
