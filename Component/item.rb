class Item
  attr_writer :genre, :author, :source, :lable
  attr_reader :id, :archived
  attr_accessor :publish_date

  def initialze(publish_date)
    @id = Randome.rand(1...1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
