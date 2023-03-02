require_relative 'utils/music_genre'
require_relative 'utils/book_label'
require_relative 'utils/game_author'

class App
  def initialize
    @albums = AlbumGenre.new
    @books = BookLabel.new
    @games = GameAuthor.new
  end

  def select_one_activity(input)
    case input
    when 2
      @albums.list_all_album
    when 4
      @albums.list_all_genre
    when 8
      @albums.add_music_albume
    when 1
      @books.list_all_book
    when 5
      @books.list_all_label
    when 7
      @books.add_book_label
    when 3
      @games.list_all_games
    when 6
      @games.list_all_authors
    when 9
      @games.add_game
    end
  end
end

def main
  app = App.new
  puts [' ', '        -----Catalog of My Thing------', ' ']

  input = 0
  until input == 10
    puts [' ', 'Present the User with a List of Option to Perform']
    puts '  1:- List all books'
    puts '  2:- List all music albums'
    puts '  3:- List all games'
    puts '  4:- List all genres'
    puts '  5:- List all lables'
    puts '  6:- List all authors'
    puts '  7:- Add a book'
    puts '  8:- Add a music album'
    puts '  9:- Add a game'
    puts '  10:- Exit'
    input = gets.chop.to_i
    puts 'Invalid choice, please select a number from [1..10]' if input < 1 || input > 10
    app.select_one_activity(input)
  end
end
main
