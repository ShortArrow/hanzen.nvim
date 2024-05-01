local M = {}

function M.string_to_table(input)
  local output = {}
  local i = 1
  while i <= #input do
    local c = string.byte(input, i)
    local len = 1
    if c > 0x7F then
      if c >= 0xC0 and c <= 0xDF then     -- 0b110xxxxx
        len = 2
      elseif c >= 0xE0 and c <= 0xEF then -- 0b1110xxxx
        len = 3
      elseif c >= 0xF0 and c <= 0xF7 then -- 0b11110xxx
        len = 4
      end
    end
    table.insert(output, string.sub(input, i, i + len - 1))
    i = i + len
  end
  return output
end

return M
