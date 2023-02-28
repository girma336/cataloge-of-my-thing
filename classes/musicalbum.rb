require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, no_spotify: true)
    super(publish_date)
    @on_spotify = no_spotify
  end

  def to_json(*_args)
    {
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
