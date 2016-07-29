# Should have:
# - artist √
# - title √
# - lyrics?

class Song

  def initialize(artist, title)
    @song_info = {
      artist: artist,
      title: title
    }
  end

  def artist
    return @song_info[:artist]
  end

  def title
    return @song_info[:title]
  end

end