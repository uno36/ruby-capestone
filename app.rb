require_relative 'module/music_module'
require_relative 'module/game_module'
require_relative 'module/book_module'
require_relative 'module/add_book_module'

class App
  include MusicModule
  include ReadMusic
  include WriteMusic
  include ReadGenre
  include WriteGenre
  include GameModule
  include LibraryModule
  include AddBookModule

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

  def add_a_game
    add_game
    display_options
  end

  def list_of_games
    game_list_display
    display_options
  end

  def list_all_authors
    author_list_display
    display_options
  end

  def add_book
    add_a_book
    author_list_display
  end

  def list_all_books
    LibraryModule.list_all_books
  end

  def list_all_labels
    label_list_display
    display_options
  end
end
