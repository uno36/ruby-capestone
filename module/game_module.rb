require 'JSON'
require_relative '../classes/gameClass/game'
require_relative 'author_module'

module GameModule
  include AuthorModule
  def add_game
    print "\nThe Game is Multi Player [true/false]: "
    multiplayer = gets.chomp.to_s
    puts "\nInput Game Information:"
    print 'Game author: '
    author_list_display
    print "Enter '0' to cleate new author: "
    input = gets.chomp.to_i
    author = author_choice(input)
    print 'Last played date  [dd-mm-yyyy]: '
    last_played_at = gets.chomp
    game = Game.new(author, last_played_at, multiplayer)
    fetch_game_data
    new_game_data = fetch_game_data << game.to_hash
    save_game_data(new_game_data)
    puts 'Game created and saved......'
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
    puts "\nHere is the list of games: "
    list = fetch_game_data
    if list.empty?
      puts 'No Games found.'
    else
      list.each_with_index do |item, index|
      puts "#{index + 1}) id: #{item['id']}, Author Name: #{item['author']['first_name']} #{item['author']['last_name']}, " \
           "multiplayer: #{item['multiplayer']}, Last playing date: #{item['last_played_at']}"
      end
    end
  end
end
