require("minitest/autorun")
require("minitest/rg")

require_relative("../models/member")

class MemberTest < MiniTest::Test

  def setup
    @member = Member.new("James", "Beckett", 23)
  end

  def test_pretty_name
    assert_equal("James Beckett", @member.pretty_name)
  end

end 
