local M = {
  katakana = {}
}

local feature = require 'hanzen.feature'
local katakana = require 'hanzen.katakana'

function M.hello()
  print("Hello, I am Hanzen!")
end

---Rewrite reversed text
function M.reverse_text()
  local start_row, start_col, end_row, end_col = feature.get_selected_range()
  local concat_text = feature.get_selected_text(start_row, start_col, end_row, end_col)

  -- process text here
  local processed_text = concat_text:reverse()

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.split(processed_text, "\n"))
end

---Rewrite Zenkaku katakana to Hankaku katakana
function M.katakana.full_to_half()
  local start_row, start_col, end_row, end_col = feature.get_selected_range()
  local end_byte = feature.get_byte_at_position(end_row, end_col)
  local detectd_byte_length = feature.get_byte_length_from_firstone(end_byte)
  local concat_text = feature.get_selected_text(start_row, start_col, end_row, end_col + detectd_byte_length - 1)

  -- process text here
  local processed_text = katakana.full_to_half(concat_text)

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col + detectd_byte_length - 1,
    vim.split(processed_text, "\n"))
end

---Rewrite Hankaku katakana to Zenkaku katakana
function M.katakana.half_to_full()
  local start_row, start_col, end_row, end_col = feature.get_selected_range()
  local end_byte = feature.get_byte_at_position(end_row, end_col)
  local detectd_byte_length = feature.get_byte_length_from_firstone(end_byte)
  local concat_text = feature.get_selected_text(start_row, start_col, end_row, end_col + detectd_byte_length - 1)

  -- process text here
  local processed_text = katakana.half_to_full(concat_text)

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col + detectd_byte_length - 1,
    vim.split(processed_text, "\n"))
end

return M
