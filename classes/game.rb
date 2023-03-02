require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*_args)
    {
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    today_date = Date.today.strftime('%Y-%m-%d')

    parsed = Date.parse(today_date)

    last_played_date = Date.parse(@last_played_at)

    difference_in_years = (parsed.year - last_played_date.year).to_i

    super && (difference_in_years > 2)
  end
end
