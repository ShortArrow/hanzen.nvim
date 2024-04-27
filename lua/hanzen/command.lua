local M = {}

local get_selected_range = require 'hanzen.feature'.get_selected_range
local get_selected_text = require 'hanzen.feature'.get_selected_text

function M.hello()
  print("Hello, I am Hanzen!")
end

function M.reverse_text()
  local start_row, start_col, end_row, end_col = get_selected_range()
  local concat_text = get_selected_text(start_row, start_col, end_row, end_col)

  -- process text here
  local processed_text = concat_text:reverse()

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.split(processed_text, "\n"))
end

return M
