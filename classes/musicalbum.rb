require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialze(publish_date, on_spotify: true)
    @on_spotify = on_spotify
    super(publish_date)
  end
end
