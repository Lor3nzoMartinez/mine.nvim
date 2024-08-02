require('gitsigns').setup({
    current_line_blame_opts = {
        virt_text = true,
        color="#00FF00",
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
})

vim.cmd.Gitsigns("toggle_current_line_blame")
