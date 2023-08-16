require 'JSON'
require_relative '../classes/gameClass/game'
require_relative 'author_module'

module GameModule
  include AuthorModule
  def add_game
    puts "\nInput Game Information"
    puts 'Game genre: '
    genre = gets.chomp
    puts 'Game author: '
    author_list_display
    puts 'Select [0] to cleate new Author'
    input = gets.chomp.to_i
    author = author_choice(input)
    puts 'Game source: '
    source = gets.chomp
    puts 'Game label: '
    label = gets.chomp
    puts 'Game publish date [dd/mm/yyy]'
    publish_date = gets.chomp
    puts 'Last played date  [dd/mm/yyy]'
    last_played_at = gets.chomp
    game = Game.new(genre, author, source, label, publish_date, last_played_at)
    fetch_game_data
    new_game_data = fetch_game_data << game.to_hash
    save_game_data(new_game_data)
    puts 'Game created......'
  end

  def author_choice(selection)
    if selection.zero?
      create_author
      fetch_author_data[-1]
    else
      fetch_author_data[selection - 1]
    end
  end

  def fetch_game_data
    existing_game = []
    existing_game = JSON.parse(File.read('JSON/game.json')) if File.exist?('JSON/game.json')
    existing_game
  end

  def save_game_data(data)
    File.open('JSON/game.json', 'w') do |file|
      JSON.dump(data, file)
    end
  end

  def game_list_display
    puts "\nHere is the list of games"
    list = fetch_game_data
    list.each_with_index do |item, index|
      puts "#{index + 1}) id: #{item['id']}, label: #{item['label']}, author: #{item['author']}, " \
           "multiplayer: #{item['multiplayer']}, publish_date: #{item['publish_date']}"
    end
  end
end
