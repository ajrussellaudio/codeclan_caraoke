require "minitest/autorun"
require "minitest/rg"
require_relative "../room"
require_relative "../song"
require_relative "../guest"

# require "pry-byebug"

class TestRoom < MiniTest::Test

  def setup
    @bohem_rhap = Song.new("Queen", "Bohemian Rhapsody")
    @i_will_survive = Song.new("Gloria Gaynor", "I Will Survive")
    @alan = Guest.new("Alan Russell", 500)
    @marj = Guest.new("Marj Clark", 100)
    @test_room = Room.new(10)
  end

  def test_it_has_capacity
    assert_equal(10, @test_room.capacity)
  end

  def test_can_add_song
    @test_room.add_song(@bohem_rhap)
    assert_equal(1, @test_room.playlist.count)
  end

  def test_cannot_add_duplicate_songs
    @test_room.add_song(@bohem_rhap)
    @test_room.add_song(@i_will_survive)
    @test_room.add_song(@bohem_rhap)
    assert_equal(2, @test_room.playlist.count)
  end

  def test_can_add_guest
    @test_room.add_guest(@alan)
    assert_equal(1, @test_room.guests.count)
  end

  def test_cannot_add_duplicate_guests
    @test_room.add_guest(@alan)
    @test_room.add_guest(@marj)
    @test_room.add_guest(@alan)
    assert_equal(2, @test_room.guests.count)
  end

  def test_can_check_for_space
    test_party = [@alan, @marj]
    @test_room.add_party(test_party)
    assert_equal(8, @test_room.spaces_left)
  end

  def test_can_check_for_space__boolean
    test_party = [@alan, @marj]
    @test_room.add_party(test_party)
    assert_equal(true, @test_room.any_spaces_left?)
  end

  def test_can_check_for_space__room_full
    test_party = [@alan, @marj]
    room_for_two = Room.new(2)
    room_for_two.add_party(test_party)
    assert_equal(false, room_for_two.any_spaces_left?)
  end

  def test_can_get_guests_names
    @test_room.add_party([@alan, @marj])
    assert_equal(["Alan Russell", "Marj Clark"], @test_room.guest_names)
  end

  def test_it_can_remove_guest
    @test_room.add_party([@alan, @marj])
    @test_room.remove_guest(@alan)
    assert_equal(1, @test_room.guests.count)
  end


end