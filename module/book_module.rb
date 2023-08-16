require_relative 'DataHandler'
require_relative '../classes/bookClass/book'  

module LibraryModule
  def self.list_all_books
    data = DataHandler.load_data
    data.each do |item_data|
      puts "Title: #{item_data['label']}, Author: #{item_data['author']}, Genre: #{item_data['genre']}"
    end
  end

  def self.add_book(genre, author, source, label, publish_date, cover_state)
    data = DataHandler.load_data
    book = Book.new(genre, author, source, label, publish_date, cover_state)
    data << book.to_h
    DataHandler.save_data(data)
    puts "Book '#{label}' added successfully!"
  end
end
