local M = {}

local zenkakuTarget = ""
    .. "アイウエオ"
    .. "カキクケコ"
    .. "サシスセソ"
    .. "タチツテト"
    .. "ナニヌネノ"
    .. "ハヒフヘホ"
    .. "マミムメモ"
    .. "ヤユヨ"
    .. "ラリルレロ"
    .. "ワヲン"

---Convert Zenkaku katakana to Hankaku katakana
---@param inputtext string target text
---@return string zenkaku_text
function M.zenkana_to_hankana(inputtext)
  local result, _ = inputtext:gsub("[ア-ン]", function(c)
    return c .. ":"
  end)
  return result
end

function M.parse_katakana(input)
  local output = {}
  local i = 1
  local len = #input

  while i <= len do
    local char = input:sub(i, i)
    local byte = string.byte(char)
    -- 特定のパターンを検出して処理
    --アイウエオの場合
    if byte == 0xE3 then
      local next_char = input:sub(i + 1, i + 1)
      local next_byte = string.byte(next_char)
      if next_byte == 0x82 then
        local next_next_char = input:sub(i + 2, i + 2)
        local next_next_byte = string.byte(next_next_char)
        if next_next_byte == 0xA2 then
          output[#output + 1] = "ｱ"
          i = i + 3
        elseif next_next_byte == 0xA4 then
          output[#output + 1] = "ｲ"
          i = i + 3
        elseif next_next_byte == 0xA6 then
          output[#output + 1] = "ｳ"
          i = i + 3
        elseif next_next_byte == 0xA8 then
          output[#output + 1] = "ｴ"
          i = i + 3
        elseif next_next_byte == 0xAA then
          output[#output + 1] = "ｵ"
          i = i + 3
        end
      end
    end
    -- ワオンの場合
    if byte == 0xE3 then
      local next_char = input:sub(i + 1, i + 1)
      local next_byte = string.byte(next_char)
      if next_byte == 0x83 then
        local next_next_char = input:sub(i + 2, i + 2)
        local next_next_byte = string.byte(next_next_char)
        if next_next_byte == 0x8F then
          output[#output + 1] = "ﾜ"
          i = i + 3
        elseif next_next_byte == 0x92 then
          output[#output + 1] = "ｦ"
          i = i + 3
        elseif next_next_byte == 0x93 then
          output[#output + 1] = "ﾝ"
          i = i + 3
        end
      end
    end
    -- ガギグゲゴの場合
    if byte == 0xE3 then
      local next_char = input:sub(i + 1, i + 1)
      local next_byte = string.byte(next_char)
      if next_byte == 0x82 then
        local next_next_char = input:sub(i + 2, i + 2)
        local next_next_byte = string.byte(next_next_char)
        if next_next_byte == 0xAC then
          output[#output + 1] = "ｶ"
          i = i + 3
        elseif next_next_byte == 0xAE then
          output[#output + 1] = "ｷ"
          i = i + 3
        elseif next_next_byte == 0xB0 then
          output[#output + 1] = "ｸ"
          i = i + 3
        elseif next_next_byte == 0xB2 then
          output[#output + 1] = "ｹ"
          i = i + 3
        elseif next_next_byte == 0xB4 then
          output[#output + 1] = "ｺ"
          i = i + 3
        end
      end
    end
  end

  return table.concat(output)
end

return M
