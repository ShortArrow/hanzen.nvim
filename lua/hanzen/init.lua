local M = {}

M.command = require 'hanzen.command'

local function complete_args(arg_lead, cmdline, cursor_pos)
  local _ = cmdline
  local _ = cursor_pos
  local candidates = { 'hiragana', 'katakana', 'alphabet', 'number' }
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
    local target = options.args
    if target == 'hiragana' then
      print('not implemented yet: ' .. target)
    elseif target == 'katakana' then
      M.command.katakana.full_to_half()
    elseif target == 'alphabet' then
      print('not implemented yet: ' .. target)
    elseif target == 'number' then
      print('not implemented yet: ' .. target)
    else
      error('Invalid target: ' .. target)
    end
  end, {
    range = true,
    nargs = 1,
    complete = complete_args,
    desc = 'Convert text between hiragana, katakana, alphabet, and number'
  })
  vim.api.nvim_create_user_command('HanzenHalfToFull', function(options)
    local target = options.args
    if target == 'hiragana' then
      print('not implemented yet: ' .. target)
    elseif target == 'katakana' then
      M.command.katakana.half_to_full()
    elseif target == 'alphabet' then
      print('not implemented yet: ' .. target)
    elseif target == 'number' then
      print('not implemented yet: ' .. target)
    else
      error('Invalid target: ' .. target)
    end
  end, {
    range = true,
    nargs = 1,
    complete = complete_args,
    desc = 'Convert text between hiragana, katakana, alphabet, and number'
  })
  vim.api.nvim_create_user_command('HanzenCurrentBuffer', function()
    print('not implemented yet')
  end, { range = true })
end

return M
