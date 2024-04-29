local katakana = require "hanzen.katakana"
describe("katakana",
  function()
    it("zenkaku len", function()
      local target = "ア"
      assert.equals(3, string.len(target))
      assert.equals(2, vim.api.nvim_strwidth(target))
      assert.equals(2, vim.fn.strdisplaywidth(target))
    end)
    it("parse_katakana", function()
      local target = "アイウエオ"
      assert.equals("ｱｲｳｴｵ", katakana.parse_katakana(target))
    end)
    it("kakikukeko", function()
      local target = "カキクケコ"
      assert.equals("ｱｲｳｴｵ", katakana.parse_katakana(target))
    end)
  end
)
