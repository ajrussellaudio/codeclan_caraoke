require "minitest/autorun"
require "minitest/rg"
require_relative "../room"
require_relative "../song"

class TestRoom < MiniTest::Test

  def setup
    @bohem_rhap = Song.new("Queen", "Bohemian Rhapsody")
    @i_will_survive = Song.new("Gloria Gaynor", "I Will Survive")
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

end