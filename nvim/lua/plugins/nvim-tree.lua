return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			git = {
				enable = true,
			},
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
				update_root = true,
			},
		})

		vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
	end,
}
