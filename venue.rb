# Should have:
# - rooms
# - entry fee

# Should be able to:
# - check guests in to room
# - check guests out

class Venue

  attr_reader :rooms

  def initialize(rooms)
    @rooms = rooms
  end

end