class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialze(name)
    @id = Randome.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end
end
