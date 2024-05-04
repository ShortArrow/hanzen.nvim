local number = require "hanzen.number"
describe("number",
  function()
    it("half to full", function()
      local target = "1234567890"
      local expected = "１２３４５６７８９０"
      local actual = number.half_to_full(target)
      assert.equals(expected, actual)
    end)
    it("half to full mixed", function()
      local target = "123ｱ456a7890"
      local expected = "１２３ｱ４５６a７８９０"
      local actual = number.half_to_full(target)
      assert.equals(expected, actual)
    end)
    it("full to half", function()
      local target = "１２３４５６７８９０"
      local expected = "1234567890"
      local actual = number.full_to_half(target)
      assert.equals(expected, actual)
    end)
    it("full to half mixed", function()
      local target = "１２３ア４５６ａ７８９０"
      local expected = "123ア456ａ7890"
      local actual = number.full_to_half(target)
      assert.equals(expected, actual)
    end)
  end
)
