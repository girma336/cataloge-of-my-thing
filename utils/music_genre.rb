require 'json'
require 'fileutils'
require_relative '../classes/musicalbum'
require_relative '../classes/genre'

class AlbumGenre
  FILE_ALBUM = 'data/musicalbum.json'.freeze
  FILE_GENRE = 'data/genre.json'.freeze
  def initialize
    @albums = load_album
    @genre = load_genre
  end

  def load_album
    if File.directory?('data') && File.file?(FILE_ALBUM)
      File.zero?(FILE_ALBUM) ? [] : JSON.parse(File.read(FILE_ALBUM))
    elsif File.directory?('data') && !File.exist?(FILE_ALBUM)
      FileUtils.touch(FILE_ALBUM)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_ALBUM)
      []
    end
  end

  def load_genre
    if File.directory?('data') && File.file?(FILE_GENRE)
      File.zero?(FILE_GENRE) ? [] : JSON.parse(File.read(FILE_GENRE))
    elsif File.directory?('data') && !File.exist?(FILE_GENRE)
      FileUtils.touch(FILE_GENRE)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_GENRE)
      []
    end
  end

  def save_genre_album
    File.write(FILE_ALBUM, JSON.pretty_generate(@albums))
    File.write(FILE_GENRE, JSON.pretty_generate(@genre))
  end

  def add_music_albume
    print 'Publish Date: '
    publi_date = gets.chomp
    correct_format(publi_date)
    print 'Music albume is spotify or not [y/n]: '
    value = gets.chomp.capitalize
    case value
    when 'Y'
      value = true
    when 'N'
      value = false
    else
      puts ['please inter the correct input ether y or n']
      value = gets.chomp.capitalize
    end

    print 'Name of Genre: '
    name_genre = gets.chomp.capitalize

    @albums << MusicAlbum.new(publi_date, no_spotify: value).to_json
    @genre << Genre.new(name_genre).to_json
    save_genre_album
    puts ['', 'Music Album Succesfuly added !!!', ' ']
  end

  def list_all_album
    @albums.each_with_index do |album, idx|
      print "#{idx}) Publish date: #{album['publish_date']}, Is this Spotify? ", album['on_spotify'] ? "Yes\n" : "No\n"
    end
    puts 'No List of Album in the list ' if @albums.empty?
    puts ' '
  end

  def list_all_genre
    @genre.each_with_index do |genre, index|
      puts "#{index}) Genre Name: #{genre['name']}"
    end
    puts 'No list of gener' if @genre.empty?
    puts ' '
  end

  def validate_date(string)
    format_ok = string.match(/\d{4}-\d{2}-\d{2}/)
    parseable = begin
      Date.strptime(string, '%Y-%m-%d')
                rescue StandardError
                  false
    end

    if string == 'never' || format_ok && parseable
      true
    else
      false
    end
  end

  def correct_format(publi_date)
    until validate_date(publi_date)
      puts 'please insert in this 2023-12-03'
      print 'Publish Date: '
      publi_date = gets.chomp
    end
  end
end
