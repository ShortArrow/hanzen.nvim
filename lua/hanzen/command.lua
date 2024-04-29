local M = {}

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
function M.zenkanaToHankana()
  local start_row, start_col, end_row, end_col = feature.get_selected_range()
  local concat_text = feature.get_selected_text(start_row, start_col, end_row, end_col)

  -- process text here
  local processed_text = katakana.zenkana_to_hankana(concat_text)

  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.split(processed_text, "\n"))
end

return M
