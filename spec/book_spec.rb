require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  describe 'New Book Object' do
    it 'should be an instance of book' do
      @book = Book.new('2015-04-21', 'Ebo White', 'bad')

      expect(@book).to be_an_instance_of Book
    end
  end

  describe 'Item Child' do
    it 'should inherit from Item class' do
      @book = Book.new('2015-04-21', 'Ebo White', 'bad')

      expect(Book).to be < Item
    end
  end

  describe 'move_to_archive method for checking can_be_archived' do
    it 'should return true' do
      @book = Book.new('2015-04-21', 'Ebo White', 'bad')

      @book.move_to_archive
      expect(@book.archived).to be true
    end
  end
end
