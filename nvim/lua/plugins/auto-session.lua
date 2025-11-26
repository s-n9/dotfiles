return {
	"rmagatti/auto-session",
	lazy = false,

	config = function()
		local auto_session = require("auto-session")
		auto_session.setup({
			auto_restore = false,
			suppressed_dirs = { "~/", "~/Downloads", "~/Documents" },
		})

		vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession save<CR>", { desc = "Save session" })
		vim.keymap.set("n", "<leader>sr", "<cmd>AutoSession restore<CR>", { desc = "Restore last session" })
		vim.keymap.set("n", "<leader>sd", "<cmd>AutoSession delete<CR>", { desc = "Delete session" })
	end,
}
