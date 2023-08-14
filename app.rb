menu_options = [
  'List all books',
  'List all music albums',
  'List all games',
  'List all genres',
  'List all labels',
  'List all authors',
  'List all sources',
  'Add a book',
  'Add a music album',
  'Add a game',
  'Quit'
]

def quit_app
  puts 'Quitting the app. Goodbye!'
end

loop do
  puts 'Select an option:'
  menu_options.each_with_index { |option, index| puts "#{index + 1}. #{option}" }

  choice = gets.chomp.to_i
  case choice
  when 1
    List all books
  when 2
    List all music albums
  when 3
    List all games
  when 4
    List all genres
  when 5
    List all labels
  when 6
    List all authors
  when 7
    List all sources
  when 8
    Add a book
  when 9
    Add a music album
  when 10
    Add a game
  when 11
    quit_app
    break
  else
    puts 'Invalid choice. Please select a valid option.'
  end
end
