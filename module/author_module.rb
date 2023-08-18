require 'json'
require_relative '../classes/authorClass/author'

module AuthorModule
  def add_author
    puts "\nHere is the list of authors"
    return if File.exist?('JSON/author.json')

    create_author
  end

  def fetch_author_data
    existing_author = []
    existing_author = JSON.parse(File.read('JSON/author.json')) if File.exist?('JSON/author.json')
    existing_author
  end

  def save_author_data(data)
    File.open('JSON/author.json', 'w') do |file|
      JSON.dump(data, file)
    end
  end

  def author_list_display
    puts "\nHere is the list of authors"
    list = fetch_author_data
    list.each_with_index do |item, index|
      puts "#{index + 1}) id: #{item['id']}, Author Name: #{item['first_name']} #{item['last_name']}"
    end
  end

  def create_author
    puts 'Author First Name: '
    first_name = gets.chomp.to_s
    puts 'Author Last Name: '
    last_name = gets.chomp.to_s
    author = Author.new(first_name, last_name).to_hash
    existing_author = fetch_author_data
    existing_author << author
    save_author_data(existing_author)
    puts 'Author has been created successfully!'
  end
end
