# Should have:
# - list of guests √
# - playlist of songs √

# Should be able to:
# - add song to room playlist √
# - add guests or groups to room √

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

  def add_party(party)
    party.each {|guest| add_guest(guest)}
  end

  def spaces_left()
    return @capacity - @guests.count
  end

  def any_spaces_left?()
    return true if spaces_left > 0
    return false
  end

  def guest_names()
    return @guests.map {|guest| guest.name}
  end


end