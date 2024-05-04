local M = {}

local feature = require 'hanzen.feature'
local katakana = require 'hanzen.katakana'
local number = require 'hanzen.number'

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

---Get Full to Half Processor function from target kind name
---@param option string
---@return function | nil
local function get_full_to_half_processor(option)
  if option == 'katakana' then
    return katakana.full_to_half
  elseif option == 'alphabet' then
    return nil -- not implemented yet
  elseif option == 'number' then
    return number.full_to_half
  end
end

---Get Half to Full Processor function from target kind name
---@param option string
---@return function | nil
local function get_half_to_full_processor(option)
  if option == 'katakana' then
    return katakana.half_to_full
  elseif option == 'alphabet' then
    return nil -- not implemented yet
  elseif option == 'number' then
    return number.half_to_full
  end
end

---Rewrite Full length to Half length
---@param option string
function M.full_to_half(option)
  local start_row, start_col, end_row, end_col = feature.get_selected_range()
  local end_byte = feature.get_byte_at_position(end_row, end_col)
  local detectd_byte_length = feature.get_byte_length_from_firstone(end_byte)
  local concat_text = feature.get_selected_text(start_row, start_col, end_row, end_col + detectd_byte_length - 1)

  local processor = get_full_to_half_processor(option)
  if processor == nil then
    print('not implemented yet: ' .. option)
    return
  end

  -- process text here
  local processed_text = processor(concat_text)
  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col + detectd_byte_length - 1,
    vim.split(processed_text, "\n"))
end

---Rewrite Half length to Full length
function M.half_to_full(option)
  local start_row, start_col, end_row, end_col = feature.get_selected_range()
  local end_byte = feature.get_byte_at_position(end_row, end_col)
  local detectd_byte_length = feature.get_byte_length_from_firstone(end_byte)
  local concat_text = feature.get_selected_text(start_row, start_col, end_row, end_col + detectd_byte_length - 1)

  local processor = get_half_to_full_processor(option)
  if processor == nil then
    print('not implemented yet: ' .. option)
    return
  end

  -- process text here
  local processed_text = processor(concat_text)
  -- Rewrite text
  vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col + detectd_byte_length - 1,
    vim.split(processed_text, "\n"))
end

return M
