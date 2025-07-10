vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Neo-tree binds
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({
    toggle = true,
    position = "left",
  })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>r", function()
  require("neo-tree.command").execute({
    toggle = true,
    source = "buffers", 
    position = "bottom",
  })
end, { noremap = true, silent = true })
