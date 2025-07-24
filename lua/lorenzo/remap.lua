vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("buffer #")
end, { noremap = true, silent = true })

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
		position = "float",
	})
end, { noremap = true, silent = true })
