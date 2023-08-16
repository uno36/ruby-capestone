require_relative 'module/music_module'
require_relative 'classes/gameClass/game'
require_relative 'classes/authorClass/author'

class App
  include MusicModule
  include ReadMusic
  include WriteMusic
  include ReadGenre
  include WriteGenre

  def initialize
    @genre = read_genre
    @music_album = read_list
  end

  def run
    display_options
  end

  def list_all_music_albums
    music_list
  end

  def list_all_genres
    show_genres
  end

  def add_a_music_album
    add_a_music
  end

  # ------------------------Game-Section-Start---------------------------------------------
  def add_game
    puts "\nInput Game Information"
    puts 'Title of the game: '
    title = gets.chomp # title of the game
    puts 'Genre of this game: '
    genre = gets.chomp.split(',')
    puts 'source of the game'
    source = gets.chomp
    puts 'Author of the game'
    author = gets.chomp
    puts 'Last played date: '
    lastplayeddate = gets.chomp
    Game.new(title, genre, source, author, lastplayeddate)
  end
  # ------------------------Game-Section-end-----------------------------------------------
end
