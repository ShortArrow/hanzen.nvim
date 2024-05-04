local M = {}

M.command = require 'hanzen.command'

local function complete_args(arg_lead, cmdline, cursor_pos)
  local _ = cmdline
  local _ = cursor_pos
  local candidates = { 'hiragana', 'katakana', 'alphabet', 'number', 'all' }
  return vim.tbl_filter(function(item)
    return vim.startswith(item, arg_lead)
  end, candidates)
end

function M.setup()
  -- Add Excommands
  vim.api.nvim_create_user_command('HanzenReverse', function()
    M.command.reverse_text()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenInfo', function()
    M.command.hello()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenFullToHalf', function(options)
    M.command.full_to_half(options.args)
  end, {
    range = true,
    nargs = 1,
    complete = complete_args,
    desc = 'Convert text between hiragana, katakana, alphabet, number and all'
  })
  vim.api.nvim_create_user_command('HanzenHalfToFull', function(options)
    M.command.half_to_full(options.args)
  end, {
    range = true,
    nargs = 1,
    complete = complete_args,
    desc = 'Convert text between hiragana, katakana, alphabet, number and all'
  })
  vim.api.nvim_create_user_command('HanzenCurrentBuffer', function()
    print('not implemented yet')
  end, { range = true })
end

return M
