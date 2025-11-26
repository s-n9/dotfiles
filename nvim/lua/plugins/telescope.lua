return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")

    telescope.load_extension("fzf")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
      },
    })

    vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent Files" })
    vim.keymap.set("n", "<leader>pf", ":Telescope live_grep<CR>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
  end,
}
