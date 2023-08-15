require_relative 'music_album'

# Creating a list of MusicAlbum instances
albums = []
albums << MusicAlbum.new('Album 1', on_spotify: true, genre: 'Pop', author: 'Artist 1', source: 'CD',
                                    label: 'Music Label', publish_date: Time.now - (365 * 11 * 24 * 60 * 60))
albums << MusicAlbum.new('Album 2', on_spotify: false, genre: 'Rock', author: 'Artist 2', source: 'Digital',
                                    label: 'Rock Records', publish_date: Time.now - (365 * 8 * 24 * 60 * 60))
# Add more albums as needed

# Display the list of music albums
puts 'List of Music Albums:'
albums.each_with_index do |album, index|
  puts "#{index + 1}. #{album.name} (#{album.genre})"
end
