local M = {}

local utf8 = require "hanzen.utf8"

local full_to_half = {
  ["ア"] = "ｱ",
  ["イ"] = "ｲ",
  ["ウ"] = "ｳ",
  ["エ"] = "ｴ",
  ["オ"] = "ｵ",
  ["ァ"] = "ｧ",
  ["ィ"] = "ｨ",
  ["ゥ"] = "ｩ",
  ["ェ"] = "ｪ",
  ["ォ"] = "ｫ",
  ["カ"] = "ｶ",
  ["キ"] = "ｷ",
  ["ク"] = "ｸ",
  ["ケ"] = "ｹ",
  ["コ"] = "ｺ",
  ["ガ"] = "ｶﾞ",
  ["ギ"] = "ｷ",
  ["グ"] = "ｸ",
  ["ゲ"] = "ｹ",
  ["ゴ"] = "ｺ",
  ["ワ"] = "ﾜ",
  ["ヲ"] = "ｦ",
  ["ン"] = "ﾝ"
}

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
