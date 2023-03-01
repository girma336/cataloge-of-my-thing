require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  describe 'New' do
    it 'should take two arguments and create a Label object' do
      @label = Label.new('In the chest of a woman', 'Violet')

      expect(@label).to be_an_instance_of Label
    end
  end

  describe '#add_item' do
    it 'should return a non-empty items array' do
      @label = Label.new('In the chest of a woman', 'Violet')

      item = Item.new('2022-04-21')
      @label.items << item
      expect(@label.items.empty?).to be false
    end
  end
end
