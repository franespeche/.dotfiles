local mock = require('luassert.mock')
-- local stub = require('luassert.stub')

describe("Display list of recent files (:h oldfiles)", function()

  it("Correctly reads files from vim.v.oldfiles", function()
    assert.is_not_nil(vim.v.oldfiles)
  end)

end
)
