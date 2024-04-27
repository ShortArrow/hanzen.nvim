local M = {}

local reverse_text = require 'hanzen.command'.reverse_text
local hello = require 'hanzen.command'.hello

function M.setup()
  -- Add Excommands
  vim.api.nvim_create_user_command('HanzenReverse', function()
    reverse_text()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenInfo', function()
    hello()
  end, { range = true })
end

return M
