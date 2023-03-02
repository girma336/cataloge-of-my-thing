require 'date'
require_relative '../classes/author'
require_relative '../classes/item'
require_relative '../classes/game'


describe Author do
  before :each do
    @author = Author.new(200, 'Keenan', 'Botes')
  end

  it 'expect correct properties in input' do
    expect(@author.first_name).to eq 'Keenan'
    expect(@author.last_name).to eq 'Botes'
  end

  describe '#add_item' do
    it 'adds items to items array' do
      game_class = Game.new(220, '2020-01-15', false, 'Hi', '2023-02-14')
      @author.add_item(game_class)
      expect(game_class.author.last_name).to eq 'Botes'
      expect(@author.instance_variable_get(:@items)).to eq([game_class])
    end
  end
end
