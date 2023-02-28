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

  def add_label(lable)
    @lable = lable
  end

  def move_to_archive()
    @archived = can_be_archived?
  end

  private

  def can_be_archived?()
    current_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end
end
