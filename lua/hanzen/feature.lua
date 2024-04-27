local M = {}

---Get user selected range
---@return number start_row selected text start row
---@return number start_col selected text start col
---@return number end_row selected text end row
---@return number end_col selected text end row
function M.get_selected_range()
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))
  start_row = start_row - 1
  start_col = start_col - 1
  end_row = end_row - 1
  return start_row, start_col, end_row, end_col
end

---Get user selected text
---@param start_row number selected text start row
---@param start_col number selected text start col
---@param end_row number selected text end row
---@param end_col number selected text end row
---@return string selected_text selected text
function M.get_selected_text(start_row, start_col, end_row, end_col)
  local target_lines = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
  return table.concat(target_lines, "\n")
end

return M
