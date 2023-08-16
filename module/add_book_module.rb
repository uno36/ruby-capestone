require_relative 'book_module'
require_relative 'author_module'
require_relative 'game_module'

module AddBookModule
  include AuthorModule
  include GameModule
  def add_a_book
    puts 'Enter the genre:'
    genre = gets.chomp

    puts 'Enter the author:'
    author_list_display
    author.gets.chomp
    puts 'Select [0] to cleate new Author'
    input = gets.chomp.to_i
    author = author_choice(input)

    puts 'Enter the source:'
    source = gets.chomp

    puts 'Enter the label:'
    label = gets.chomp

    puts 'Enter the publish date:'
    publish_date = gets.chomp

    puts 'Enter the cover state (good/bad):'
    cover_state = gets.chomp

    LibraryModule.add_book(genre, author, source, label, publish_date, cover_state)
  end
end
