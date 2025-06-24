local notify = require("notify")

notify.setup({
  stages = "fade_in_slide_out", -- other options: fade, slide, static
  timeout = 3000,               -- time in ms before the notification disappears
  background_colour = "#000000",-- fallback background color for transparency
  fps = 60,                     -- animation framerate
  render = "minimal",           -- minimal, default, compact, wrapped
  top_down = true,              -- set to false to show newest at bottom
})

-- Set as default notifier
vim.notify = notify
