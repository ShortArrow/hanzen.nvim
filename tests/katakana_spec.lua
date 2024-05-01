local katakana = require "hanzen.katakana"
describe("katakana",
  function()
    it("not nil",  function()
      local target = nil
      assert.equals(true, not target)
    end)
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
    it("full to half", function()
      local target = "アイウエオaかきくけこbカキクケコ"
      assert.equals("ｱｲｳｴｵaかきくけこbｶｷｸｹｺ", katakana.full_to_half(target))
    end)
    it("full to half dakuten", function()
      local target = "ガイコク"
      assert.equals("ｶﾞｲｺｸ", katakana.full_to_half(target))
    end)
    it("half to full dakuten", function()
      local target = "ｶﾞｲｺｸ"
      assert.equals("ガイコク", katakana.half_to_full(target))
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
    it("match", function()
      local dd = {
        ["ア"] = "ｱ",
      }
      local match = dd["ア"]
      assert.equals("ｱ", match)
      match = dd["イ"]
      assert.equals(nil, match)
    end)
  end
)
