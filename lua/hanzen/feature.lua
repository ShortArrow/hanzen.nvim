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

function M.get_byte_at_position(row, col)
  -- Get the line at the specified row
  local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
  -- Get the byte at the specified column
  local byte = string.byte(line, col)
  return byte
end

function M.get_byte_length_from_firstone(end_byte)
  if end_byte > 0x7F then
    if end_byte >= 0xC0 and end_byte <= 0xDF then     -- 0b110xxxxx
      return 2
    elseif end_byte >= 0xE0 and end_byte <= 0xEF then -- 0b1110xxxx
      return 3
    elseif end_byte >= 0xF0 and end_byte <= 0xF7 then -- 0b11110xxx
      return 4
    else
      error("Invalid Byte: " .. end_byte)
    end
  else
    return 1
  end
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
