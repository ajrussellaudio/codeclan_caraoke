require "minitest/autorun"
require "minitest/rg"
require_relative "../guest"

class TestGuest < MiniTest::Test

  def setup
    @test_guest = Guest.new("Alan Russell", 500)
  end

  def test_it_has_a_name
    assert_equal("Alan Russell", @test_guest.name)
  end

  def test_it_has_money
    assert_equal(500, @test_guest.cash)
  end

end