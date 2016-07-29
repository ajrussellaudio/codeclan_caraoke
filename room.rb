# Should have:
# - list of guests
# - playlist of songs

# Should be able to:
# - add song to room playlist

class Room

  attr_reader :capacity, :playlist

  def initialize(capacity)
    @capacity = capacity
    @playlist = []
  end

  def add_song(song)
    @playlist << song if !@playlist.include?(song)
  end

end