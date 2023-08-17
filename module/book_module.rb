require_relative '../classes/bookClass/book'
require 'json'

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
      puts "#{index + 1}) Title: #{item_data['label']['title']}, publisher: #{item_data['publisher']}, Publish Date: #{item_data['publish_date']}, Cover State: #{item_data['cover_state']}"
    end
  end

  def self.add_book(label, publisher, publish_date, cover_state)
    data = load_data
    book = Book.new(label, publisher, publish_date, cover_state)
    data << book.to_h
    save_data(data)
    puts 'Book added and saved successfully!'
  end
end
