# Should have:
# - rooms √
# - entry fee √

# Should be able to:
# - check guests in to room √
# - check guests out √
# - add song to room √

class Venue

  attr_reader :rooms

  def initialize(rooms)
    @rooms = rooms
    @entry_fee = 20
  end

  def check_in(guest, room)
    if guest.cash > @entry_fee && room.any_spaces_left?
      room.add_guest(guest)
      guest.cash -= @entry_fee
    end
  end

  def add_song_to_room(song, room)
    room.add_song(song)
  end

  def add_playlist_to_room(playlist, room)
    playlist.each { |song| add_song_to_room(song, room) }
  end

  def add_party_to_room(party, room)
    party.each { |guest| check_in(guest, room) }
  end


end