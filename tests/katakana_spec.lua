local katakana = require "hanzen.katakana"
describe("katakana",
  function()
    it("zenkaku len", function()
      local target = "ア"
      assert.equals(3, string.len(target))
      assert.equals(2, vim.api.nvim_strwidth(target))
      assert.equals(2, vim.fn.strdisplaywidth(target))
    end)
    it("hankaku len", function()
      local target = "ｱ"
      assert.equals(3, string.len(target))
      assert.equals(1, vim.api.nvim_strwidth(target))
      assert.equals(1, vim.fn.strdisplaywidth(target))
    end)
    it("parse_katakana", function()
      local target = "アイウエオ"
      assert.equals("ｱｲｳｴｵ", katakana.parse_katakana(target))
    end)
    it("firstbyte", function()
      local target = "アイウエオ"
      local firstbyte = target:sub(1, 1)
      local byte = string.byte(firstbyte)
      assert.equals(0xE3, byte)
      local secondbyte = target:sub(2, 2)
      byte = string.byte(secondbyte)
      assert.equals(0x82, byte)
      local thirdbyte = target:sub(3, 3)
      byte = string.byte(thirdbyte)
      assert.equals(0xA2, string.byte(thirdbyte))
    end)
  end
)
