vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>e", ":Neotree toggle float <CR>")
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({
    toggle = true,
    position = "left",
    dir = vim.fn.expand("%:p:h"),
  })
end, { noremap = true, silent = true })
