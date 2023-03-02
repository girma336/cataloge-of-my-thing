require 'date'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(_first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items
    }
  end
end
