local M = {}

local utf8 = require "hanzen.utf8"
local full_to_half = require "hanzen.katakana.table.full_to_half"
local half_to_full = require "hanzen.katakana.table.half_to_full"

---Convert text Full to Half
---@param input string
---@return string
function M.full_to_half(input)
  local parsed = utf8.string_to_table(input)
  local output = {}
  for _, char in ipairs(parsed) do
    local half_char = full_to_half[char]
    if half_char then
      table.insert(output, half_char)
    else
      table.insert(output, char)
    end
  end
  return table.concat(output)
end

---Convert single string Half to Full
---@param input string
---@return string
local function half_to_full_single(input)
  local full_char = half_to_full[input]
  if not full_char then
    return input
  end
  return full_char
end

---Convert text Half to Full
---@param input string
---@return string
function M.half_to_full(input)
  local parsed = utf8.string_to_table(input)
  local output = {}
  -- if concat next charactor is dakuten or handakuten
  local char = ""
  local next_char = ""
  local full_char = nil
  for i = 1, #parsed do
    char = parsed[i]
    next_char = parsed[i + 1]
    if next_char == "ﾞ" or next_char == "ﾟ" then
      full_char = half_to_full[char .. next_char]
      if not full_char then
        full_char = half_to_full_single(char) .. half_to_full_single(next_char)
      end
    elseif char == "ﾞ" or char == "ﾟ" then
      full_char = nil
    else
      full_char = half_to_full_single(char)
    end
    if full_char then
      table.insert(output, full_char)
    end
  end
  return table.concat(output)
end

return M
