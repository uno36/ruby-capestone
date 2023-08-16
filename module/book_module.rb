require 'JSON'
require_relative '../classes/bookClass/book'

module LibraryModule
  FILENAME = 'JSON/library_data.json'.freeze

  def self.load_data
    if File.exist?(FILENAME)
      JSON.parse(File.read(FILENAME))
    else
      []
    end
  end

  def self.save_data(data)
    File.write(FILENAME, JSON.pretty_generate(data))
  end

  def self.list_all_books
    data = load_data
    puts 'Below is a list of all added books'
    data.each_with_index do |item_data, index|
      puts "Book #{index + 1}: Genre: #{item_data['genre']}, Title: #{item_data['label']}" \
           " Author: #{item_data['author']}, Date Published: #{item_data['publish_date']}"
    end
  end

  def self.add_book(genre, author, source, label, publish_date, cover_state)
    data = load_data
    book = Book.new(genre, author, source, label, publish_date, cover_state)
    data << book.to_h
    save_data(data)
    puts "Book '#{label}' added successfully!"
  end
end
