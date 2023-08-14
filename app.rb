menu_options = [
  "List all books",
  "List all music albums",  
  "List all games",
  "List all genres",
  "List all labels",
  "List all authors",
  "List all sources",
  "Add a book",
  "Add a music album",  
  "Add a game",
  "Quit"
]

loop do
  puts "Select an option:"
  menu_options.each_with_index { |option, index| puts "#{index + 1}. #{option}" }

  choice = gets.chomp.to_i
  case choice
  when 1
    List all books
  when 2
    List all music albums
  when 3
    List all movies
  when 4
    List all games
  when 5
    List all genres
  when 6
    List all labels
  when 7
    List all authors
  when 8
    List all sources
  when 9
    Add a book
  when 10
    Add a music album
  when 11
    Add a movie
  when 12
    Add a game
  when 13
    puts "Quitting the app. Goodbye!"
    save_data
    break
  else
    puts "Invalid choice. Please select a valid option."
  end
end
