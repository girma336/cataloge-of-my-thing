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
    (super && (Time.now - @last_played_at) > (2 * 365 * 24 * 60 * 60))
  end
end
