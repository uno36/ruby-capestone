require_relative 'app'
def menu
  @options = [
    '1 - List all books',
    '2 - List all music albums',
    '3 - List all movies',
    '4 - List all games',
    '5 - List all genres',
    '6 - List all labels',
    '7 - List all authors',
    '8 - List all sources',
    '9 - Add a book',
    '10 - Add a music album',
    '11 - Add a movie',
    '12 - Add a game',
    '13 - Exit the App'
  ]

  puts "\nPlease choose an option by entering a number:"
  puts @options
end

CHOICES = {
  1 => 'list_all_books',
  2 => 'list_all_music_albums',
  3 => 'list_all_movies',
  4 => 'list_all_games',
  5 => 'list_all_genres',
  6 => 'list_all_labels',
  7 => 'list_all_authors',
  8 => 'list_all_sources',
  9 => 'add_book',
  10 => 'add_music_album',
  11 => 'add_movie',
  12 => 'add_game'
}.freeze

def option_case(choice, app)
  case choice
  when 1..12
    app.send(CHOICES[choice])
  else
    puts 'Incorrect choice, choose a number between 1..12'
  end
end

def prompt_user(app)
  menu
  print 'Enter choice:'
  choice = gets.chomp.to_i
  choice == 13 ? app.quit_app : option_case(choice, app)

  prompt_user(app)
end

def main
  puts "\n* * * * * * * * * * * * * * * * * * *"
  puts "\n*  Welcome to Catalog of my things App!   *"
  puts "\n* * * * * * * * * * * * * * * * * * *"
  app = App.new
  prompt_user(app)
end

main
