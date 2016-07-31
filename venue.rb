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

  def check_in(guest, room_index)
    return "Not enough money!".red if guest.cash < @entry_fee
    return "Room full!".red if !rooms[room_index].any_spaces_left?
    rooms[room_index].add_guest(guest)
    guest.cash -= @entry_fee
    return "Complete!"
  end

  def check_out(guest, room_index)
    rooms[room_index].remove_guest(guest)
  end

  def add_song_to_room(song, room_index)
    rooms[room_index].add_song(song)
  end

  def add_playlist_to_room(playlist, room_index)
    playlist.each { |song| add_song_to_room(song, room_index) }
  end

  def add_party_to_room(party, room_index)
    party.each { |guest| check_in(guest, room_index) }
  end


end