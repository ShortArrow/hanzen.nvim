local utf8 = require "hanzen.utf8"

describe("katakana",
  function()
    it("zenkaku len", function()
      local target = "アイウエオaかきくけこbカキクケコ"
      local parsed = utf8.string_to_table(target)
      assert.equals("ア", parsed[1])
      assert.equals("イ", parsed[2])
      assert.equals("ウ", parsed[3])
      assert.equals("エ", parsed[4])
      assert.equals("オ", parsed[5])
      assert.equals("a", parsed[6])
      assert.equals("か", parsed[7])
      assert.equals("き", parsed[8])
      assert.equals("く", parsed[9])
      assert.equals("け", parsed[10])
      assert.equals("こ", parsed[11])
      assert.equals("b", parsed[12])
      assert.equals("カ", parsed[13])
      assert.equals("キ", parsed[14])
      assert.equals("ク", parsed[15])
      assert.equals("ケ", parsed[16])
      assert.equals("コ", parsed[17])
    end)
  end
)
