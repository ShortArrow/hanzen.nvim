local M = {}

function M.hello()
  print("Hello, I am Hanzen!")
end

function M.reverse_text()
  -- Get visual selection range
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))

  -- Get text at range
  local target_lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, {})

  -- Concat text
  local concat_text = table.concat(target_lines, "\n")

  -- process text here
  local processed_text = concat_text:reverse()

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, vim.split(processed_text, "\n"))
end

return M
