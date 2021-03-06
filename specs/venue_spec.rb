require "minitest/autorun"
require "minitest/rg"
require_relative "../venue"
require_relative "../room"
require_relative "../song"
require_relative "../guest"

class TestVenue < MiniTest::Test

  def setup
    @room_of_10 = Room.new(10)
    @room_of_20 = Room.new(20)
    @room_of_2  = Room.new(2)
    @alan = Guest.new("Alan Russell", 50)
    @marj = Guest.new("Marj Clark", 10)
    @tom = Guest.new("Tom Jones", 1000)
    @barry = Guest.new("Barry White", 1000)
    @i_will_survive = Song.new("Gloria Gaynor", "I Will Survive")
    @bohem_rhap = @bohem_rhap = Song.new("Queen", "Bohemian Rhapsody")
    @final_countdown = Song.new("Europe", "The Final Countdown")
    @test_venue = Venue.new(
      [@room_of_20, @room_of_10, @room_of_2]
      )
  end

  def test_it_has_rooms
    assert_equal(3, @test_venue.rooms.count)
  end

  def test_check_in
    @test_venue.check_in(@alan, 1)
    assert_equal(1, @test_venue.rooms[1].guests.count)
    assert_equal(30, @alan.cash)
  end

  def test_check_in__too_skint
    @test_venue.check_in(@marj, 1)
    assert_equal(0, @test_venue.rooms[1].guests.count)
  end

  def test_check_in__no_space
    @test_venue.check_in(@barry, 2)
    @test_venue.check_in(@tom, 2)
    @test_venue.check_in(@alan, 2)
    assert_equal(false, @test_venue.rooms[2].any_spaces_left?)
    assert_equal(["Barry White", "Tom Jones"], @test_venue.rooms[2].guest_names)
  end

  def test_can_add_song_to_room
    @test_venue.add_song_to_room(@i_will_survive, 1)
    assert_equal(1, @test_venue.rooms[1].playlist.size)
  end

  def test_can_add_playlist_to_room
    playlist = [@i_will_survive, @bohem_rhap, @final_countdown]
    @test_venue.add_playlist_to_room(playlist, 1)
    assert_equal(3, @test_venue.rooms[1].playlist.size)
  end

  def test_can_check_in_parties_of_guests
    test_party = [@alan, @barry]
    @test_venue.add_party_to_room(test_party, 1)
    assert_equal(2, @test_venue.rooms[1].guests.count)
  end

  def test_can_check_out_guest
    test_party = [@alan, @barry]
    @test_venue.add_party_to_room(test_party, 1)
    @test_venue.check_out(@barry, 1)
    assert_equal([@alan], @test_venue.rooms[1].guests)
  end

end