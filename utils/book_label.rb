require 'json'
require 'fileutils'
require_relative '../classes/book'
require_relative '../classes/label'

class BookLabel
  FILE_BOOK = 'data/book.json'.freeze
  FILE_LABEL = 'data/label.json'.freeze
  def initialize
    @books = load_book
    @label = load_label
  end

  def load_book
    if File.directory?('data') && File.file?(FILE_BOOK)
      File.zero?(FILE_BOOK) ? [] : JSON.parse(File.read(FILE_BOOK))
    elsif File.directory?('data') && !File.exist?(FILE_BOOK)
      FileUtils.touch(FILE_BOOK)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_BOOK)
      []
    end
  end

  def load_label
    if File.directory?('data') && File.file?(FILE_LABEL)
      File.zero?(FILE_LABEL) ? [] : JSON.parse(File.read(FILE_LABEL))
    elsif File.directory?('data') && !File.exist?(FILE_LABEL)
      FileUtils.touch(FILE_LABEL)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_LABEL)
      []
    end
  end

  def save_book_label
    File.write(FILE_BOOK, JSON.pretty_generate(@books))
    File.write(FILE_LABEL, JSON.pretty_generate(@label))
  end

  def add_book_label
    # Book
    print 'Publish Date: '
    publish_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp.capitalize
    print 'Cover_state: '
    cover_state = gets.chomp.capitalize
    # Label
    print 'Title of label: '
    title = gets.chomp.capitalize
    print 'Color of label: '
    color = gets.chomp.capitalize

    @books << Book.new(publish_date, publisher, cover_state).to_json
    @label << Label.new(title, color).to_json
    save_book_label
    puts ['', 'Book Label Succesfuly added !!!', ' ']
  end

  def list_all_book
    @books.each_with_index do |book, index|
      print "(#{index})   Publish date: #{book['publish_date']}
      Book Publisher:  #{book['publisher']}
      Book Cover_state:  #{book['cover_state']}\n"
    end
    puts 'No List of Book Exists ' if @books.empty?
    puts ' '
  end

  def list_all_label
    @label.each_with_index do |label, index|
      puts "#{index})    Label Title: #{label['title']}
      Label Color: #{label['color']} "
    end
    puts 'No List of label  Exists' if @label.empty?
    puts ' '
  end
end
