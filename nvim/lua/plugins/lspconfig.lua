return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local no_diagnostics_handler = {
			["textDocument/publishDiagnostics"] = function() end,
		}

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				spacing = 2,
				source = "if_many",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "♥︎",
					[vim.diagnostic.severity.WARN] = "⚠︎",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local on_attach = function(_, bufnr)
			local bufmap = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
			bufmap("n", "K", vim.lsp.buf.hover, "Hover info")
			bufmap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, "Code action")
		end

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
			on_attach = on_attach,
			handlers = no_diagnostics_handler,
		})

		-- lspconfig.emmet_ls.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"html",
		-- 		"typescriptreact",
		-- 		"javascriptreact",
		-- 		"css",
		-- 	},
		-- })

		vim.lsp.config("emmet_language_server", {
			capabilities = capabilities,
			filetypes = {
				"html",
				"css",
				"javascript",
				"javascriptreact",
				"typescriptreact",
			},
		})
	end,
}
