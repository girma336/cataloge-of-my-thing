require_relative '../classes/author'
require_relative '../classes/item'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds an item to the author' do
      author = Author.new('John', 'Doe')
      item = Item.new('2021-01-01')
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end

  describe '#initialize' do
    it 'sets the author last name' do
      author = Author.new('John', 'Doe')
      expect(author.last_name).to eq('Doe')
    end

    it 'generates a random author ID' do
      author1 = Author.new('John', 'Doe')
      author2 = Author.new('Jane', 'Doe')
      expect(author1.id).not_to eq(author2.id)
    end
  end
end
