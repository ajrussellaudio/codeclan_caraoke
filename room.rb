# Should have:
# - list of guests
# - playlist of songs

# Should be able to:
# - add song to room playlist

class Room

  attr_reader :capacity, :playlist, :guests

  def initialize(capacity)
    @capacity = capacity
    @playlist = []
    @guests = []
  end

  def add_song(song)
    @playlist << song if !@playlist.include?(song)
  end

  def add_guest(guest)
    @guests << guest if !@guests.include?(guest)
  end

end