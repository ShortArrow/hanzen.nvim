local M = {}

M.command = require 'hanzen.command'

function M.setup()
  -- Add Excommands
  vim.api.nvim_create_user_command('HanzenReverse', function()
    M.command.reverse_text()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenInfo', function()
    M.command.hello()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenKatakanaF2H', function()
    M.command.katakana.full_to_half()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenKatakanaH2F', function()
    M.command.katakana.half_to_full()
  end, { range = true })
end

return M
