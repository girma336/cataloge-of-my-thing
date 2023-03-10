class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def to_json(*_args)
    {
      'id' => @id,
      'name' => @name,
      'items' => @items
    }
  end
end
