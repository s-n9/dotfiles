return {
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 13
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end,
			open_mapping = [[<c-\>]],
			on_open = function(term)
				vim.fn.chansend(term.job_id, "clear\n")
			end,
			hide_numbers = true,
			shade_terminals = true,
			start_in_insert = true,
			persist_size = true,
			persist_mode = false,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			winbar = {
				enabled = true,
				name_formatter = function(term)
					return "󱄲 fuck u"
				end,
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
	end,
}
