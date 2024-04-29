describe("some basics",
  function()
    local bounter
    local bello = function(boo)
      return "hello " .. boo
    end

    before_each(function()
      bounter = 0
    end)

    it("some test", function()
      bounter = 100
      assert.equals("hello Brian", bello("Brian"))
    end)

    it("some other test", function()
      assert.equals(0, bounter)
    end)
  end
)
