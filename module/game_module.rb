require 'JSON'
require_relative '../classes/gameClass/game'

module GameModule

  def add_game
    puts "\nInput Game Information"
    puts 'Game genre: '
    genre = gets.chomp
    puts 'Game author: '
    author = gets.chomp
    puts 'Game source: '
    source = gets.chomp
    puts 'Game label: '
    label = gets.chomp
    puts 'Game publish date'
    publish_date = gets.chomp
    puts 'Last played date'
    last_played_at = gets.chomp
    game = Game.new(genre, author, source, label, publish_date, last_played_at)
    fetch_game_data
    new_game_data = fetch_game_data << game.to_hash
    save_game_data(new_game_data)
    puts "Game created......"
    end
  end

  def fetch_game_data
    existing_game = []
    if File.exist?('JSON/game.json')
      existing_game = JSON.parse(File.read('JSON/game.json'))
    end
    return existing_game
  end

  def save_game_data(data)
    File.open('JSON/game.json', 'w') do |file| JSON.dump(data, file)
  end

  def list_all_games

  end
end


