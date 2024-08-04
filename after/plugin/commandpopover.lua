local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local input = Input({
  position = "50%",
  size = {
    width = 60,
  },
  border = {
    style = "single",
    text = {
      top = "[Command]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  prompt = "> ",
  default_value = "",
  on_submit = function(value)
    vim.cmd(value)
  end,
})

-- mount/open the component
vim.keymap.set("n", "<leader>;", function()
  input:mount()
end)

-- unmount component when cursor leaves buffer
input:on(event.BufLeave, function()
  input:unmount()
end)
