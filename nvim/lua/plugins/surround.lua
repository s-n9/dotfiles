return {
	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",

					normal = "sa",
					normal_cur = "saa",
					normal_line = "sA",

					visual = "S",
					visual_line = "gS",

					delete = "sd",
					change = "sc",
				},
			})
		end,
	},
}
