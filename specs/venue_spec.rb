require "minitest/autorun"
require "minitest/rg"
require_relative "../venue"
require_relative "../room"
require_relative "../guest"

class TestVenue < MiniTest::Test

  def setup
    @room_of_10 = Room.new(10)
    @room_of_20 = Room.new(20)
    @room_of_2  = Room.new(2)
    @test_venue = Venue.new(
      [@room_of_20, @room_of_10, @room_of_2]
      )
  end

  def test_it_has_rooms
    assert_equal(3, @test_venue.rooms.count)
  end



end