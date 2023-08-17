require_relative 'book_module'
require_relative 'author_module'
require_relative 'game_module'
require_relative 'label_module'

module AddBookModule
  include AuthorModule
  include GameModule
  include LabelModule
  def add_a_book

    print 'Enter the publisher: '
    publisher = gets.chomp

    print 'Enter the publish date [dd-mm-yyyy]: '
    publish_date = gets.chomp

    puts 'Enter the label:'
    label_list_display
    print "Enter '0' to cleate new label: "
    input = gets.chomp.to_i
    label = label_choice(input)

    print 'Enter the cover state [good/bad]: '
    cover_state = gets.chomp

    LibraryModule.add_book(label, publisher, publish_date, cover_state)
  end
end
