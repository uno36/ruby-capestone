require 'json'
require_relative '../classes/Music/music_album'
require_relative '../classes/Music/genre'

module MusicModule
  def music_list
    if @music_album.empty?
      puts "Music list is empty!\n\n"
      run
    else
      puts 'Here are all the music albums:'
      @music_album.each do |album|
        puts "ID: #{album['id']} | Publish Date: #{album['publish_date']} | On Spotify: #{album['on_spotify']}"
      end
    end
  end

  def show_genres
    if @genre.empty?
      puts "Genre list is empty!\n\n"
      run
    else
      puts 'Here are all the music genres:'
      @genre.each { |genre| puts "ID: #{genre['id']} | Name: #{genre['name']}" }
    end
  end

  def add_a_music
    print 'Enter the publish date (DD-MM-YYYY): '
    publish_date = gets.chomp

    print 'Is it on Spotify? (Y/N): '
    on_spotify = gets.chomp.capitalize

    @new_album = MusicAlbum.new(publish_date, on_spotify)
    @container = []
    check_genre_list

    puts 'New music album added successfully!'
  end

  def check_genre_list
    if @genre.empty?
      add_genre
    else
      puts 'Select a genre from the list:'
      show_genres
      print 'Add a new genre [0]: '
      user_select = gets.chomp.to_i
      if user_select.zero?
        add_genre
      else
        @container.concat(@genre.select { |element| element['id'] == user_select })
        @music_album << {
          id: @new_album.id,
          archived: @new_album.can_be_archived?,
          publish_date: @new_album.publish_date,
          on_spotify: @new_album.on_spotify,
          genre: @container
        }
        add_new_music(@music_album)
      end
    end
  end

  def add_genre
    print 'Enter the new genre name: '
    @name = gets.chomp.capitalize
    new_genre = Genre.new(@name)
    @container << { id: Random.rand(1..100), name: new_genre.name }

    @music_album << {
      id: @new_album.id,
      archived: @new_album.can_be_archived?,
      publish_date: @new_album.publish_date,
      on_spotify: @new_album.on_spotify,
      genre: @container
    }

    @genre << @container[0]

    add_new_music(@music_album)
    add_new_genre(@genre)
  end
end

module ReadModule
  def read_data(file_path, empty_value)
    if File.exist?(file_path)
      data = File.open(file_path)
      JSON.parse(data.read)
    else
      puts "Creating a new #{empty_value} list file"
      File.write(file_path, [])
    end
  end
end

module WriteModule
  def write_data(file_path, new_item)
    File.write(file_path, JSON.pretty_generate(new_item))
  end
end

module ReadMusic
  include ReadModule
  def read_list
    read_data('./JSON/music_album.json', 'music')
  end
end

module ReadGenre
  include ReadModule
  def read_genre
    read_data('./JSON/genre.json', 'genre')
  end
end

module WriteMusic
  include WriteModule
  def add_new_music(new_item)
    write_data('./JSON/music_album.json', new_item)
  end
end

module WriteGenre
  include WriteModule
  def add_new_genre(new_item)
    write_data('./JSON/genre.json', new_item)
  end
end
