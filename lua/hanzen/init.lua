local M = {}

function M.hello()
  print("Hello, I am Hanzen!")
end

function M.reverse_text()
  -- Get visual selection range
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))

  -- Get text at range
  local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col, end_row - 1, end_col, {})

  -- Concat text
  local text = table.concat(lines, "\n")

  -- process text here
  local processed_text = text:reverse()

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row - 1, start_col, end_row - 1, end_col, vim.split(processed_text, "\n"))
end

function M.setup()
  -- Add Excommands
  vim.api.nvim_create_user_command('HanzenReverse', function()
    require 'hanzen'.reverse_text()
  end, { range = true })
  vim.api.nvim_create_user_command('HanzenInfo', function()
    require 'hanzen'.process_text()
  end, { range = true })
end

return M
