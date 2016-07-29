require "minitest/autorun"
require "minitest/rg"
require_relative "../song"

class TestSong < MiniTest::Test

  def setup
    @test_song = Song.new("Gloria Gaynor", "I Will Survive")
  end

  def test_it_has_title
    assert_equal("I Will Survive", @test_song.title)
  end

  def test_it_has_artist
    assert_equal("Gloria Gaynor", @test_song.artist)
  end

end