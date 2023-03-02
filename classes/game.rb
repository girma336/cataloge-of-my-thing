class Game
    attr_accessor :multiplayer, :last_played_at
    attr_reader :id

    def initialize(id, publish_date, archived, multiplayer, last_played_at)
        super(id, publish_date, archived: archived)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        return (super && (Time.now - @last_played_at) > (2 * 365 * 24 * 60 * 60))
    end
end