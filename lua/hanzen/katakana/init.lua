local M = {}

local utf8 = require "hanzen.utf8"
local full_to_half = require "hanzen.katakana.table.full_to_half"

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

return M
