class Display
  def self.list_all_genres(genres)
    if genres.empty?
      puts 'The genre list is empty, add some genres...'
    else
      puts "Genres list, count(#{genres.count}) :\n\n"
      genres.each_with_index do |genre, index|
        puts "#{index + 1}) Name: '#{genre.name}'"
      end
    end
  end

  def self.list_all_music_albums(music_albums)
    if music_albums.empty?
      puts 'The music album list is empty, add some albums...'
    else
      puts "Music Albums list, count(#{music_albums.count}) :\n\n"
      music_albums.each_with_index do |music, index|
        puts "#{index + 1}), Genre: #{music.genre.name}"
      end
    end
  end
end
