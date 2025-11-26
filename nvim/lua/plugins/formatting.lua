return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				python = { "black" },
				c = { "clang-format" },
			},

			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_follback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Prettier format" }),
		})
	end,
}
