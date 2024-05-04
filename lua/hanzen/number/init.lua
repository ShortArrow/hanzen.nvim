local M = {}

local utf8 = require "hanzen.utf8"
local full_to_half = require "hanzen.number.table.full_to_half"
local half_to_full = require "hanzen.number.table.half_to_full"

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

---Convert text Half to Full
---@param input string
---@return string
function M.half_to_full(input)
  local parsed = utf8.string_to_table(input)
  local output = {}
  for _, char in ipairs(parsed) do
    local full_char = half_to_full[char]
    if full_char then
      table.insert(output, full_char)
    else
      table.insert(output, char)
    end
  end
  return table.concat(output)
end

return M

