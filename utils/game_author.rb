require 'json'
require 'fileutils'
require_relative '../classes/game'
require_relative '../classes/author'

class GameAuthor
  FILE_GAME = 'data/game.json'.freeze
  FILE_AUTHOR = 'data/author.json'.freeze

  def initialize
    @games = load_game
    @authors = load_author
  end

  def load_game
    if File.directory?('data') && File.file?(FILE_GAME)
      File.zero?(FILE_GAME) ? [] : JSON.parse(File.read(FILE_GAME))
    elsif File.directory?('data') && !File.exist?(FILE_GAME)
      FileUtils.touch(FILE_GAME)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_GAME)
      []
    end
  end

  def load_author
    if File.directory?('data') && File.file?(FILE_AUTHOR)
      File.zero?(FILE_AUTHOR) ? [] : JSON.parse(File.read(FILE_AUTHOR))
    elsif File.directory?('data') && !File.exist?(FILE_AUTHOR)
      FileUtils.touch(FILE_AUTHOR)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_AUTHOR)
      []
    end
  end

  def save_game_author
    File.write(FILE_GAME, JSON.pretty_generate(@games))
    File.write(FILE_AUTHOR, JSON.pretty_generate(@authors))
  end

  def list_all_games
    @games.each_with_index do |game, index|
      print "(#{index} Publish date: #{game['publish_date']})
            Multiplayer: #{game['multiplayer']}
            Last played at: #{game['last_played_at']}\n"
    end
    puts 'No list of Games Exist ' if @games.empty?
    puts ''
  end

  def add_game
    print 'Publise date: '
    publish_date = gets.chomp
    print 'Mulltiplayer: '
    multiplayer = gets.chomp
    print 'last_played_at (input date as: yyyy-mm-dd): '
    last_played_at = gets.chomp
    print 'First Name: '
    f_name = gets.chomp.capitalize
    print 'Last Name: '
    l_name = gets.chomp.capitalize
    @games << Game.new(publish_date, multiplayer, last_played_at).to_json
    @authors << Author.new(f_name, l_name).to_json
    save_game_author
    puts ['... Game added added succesfully! ']
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "(#{index}) Full Name : #{author['first_name']} #{author['last_name']}"
    end
    puts 'No list of authors exist' if @authors.empty?
    puts ''
  end
end
