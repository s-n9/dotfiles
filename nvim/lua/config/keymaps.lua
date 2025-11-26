local opts = { noremap = true, silent = true }

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "p", '"_dp', opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "s", '"_s', opts)
vim.keymap.set("n", "D", '"_D', opts)
vim.keymap.set("n", "dd", '"_dd', opts)

vim.keymap.set("v", "x", '"_x', opts)
vim.keymap.set("v", "s", '"_s', opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("v", "D", '"_D', opts)

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Focus below split" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Focus above split" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Focus right split" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
