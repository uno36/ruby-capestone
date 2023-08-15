require_relative 'classes/Music/genre'
require_relative 'classes/Music/music_album'
require_relative 'classes/Music/display'

class App
  attr_reader :genres, :music_albums

  def initialize
    @genres = []
    @music_albums = []
  end

  def add_genre(item_type)
    print "#{item_type} genre: "
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def on_spotify?
    print 'Is the Music Album on Spotify? [Y/N]: '
    is_spotify = gets.chomp.downcase
    case is_spotify
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid Selection. Please enter \'y\', \'Y\' or \'n\', \'N\'!'
      on_spotify?
    end
  end

  def add_music_album
    on_spotify = on_spotify?
    print 'Date published ? (yyyy/mm/dd) (e.g 2001/01/12): '
    published_date = gets.chomp
    album = MusicAlbum.new(on_spotify, published_date)
    genre = add_genre('Music Album')
    puts "\n Music Album created successfully \n \n"
    genre.add_item(album)
    @music_albums << album
    @genres << genre
    puts "\n 'item was added successfully!"
  end

  def quit_app
    # it is here that we r going to persist data to files
    puts 'Thank you for using this app! Now exiting...'
    exit
  end

  def list_all_genres
    Display.list_all_genres(@genres)
  end

  def list_all_music_albums
    Display.list_all_music_albums(@music_albums)
  end
end
