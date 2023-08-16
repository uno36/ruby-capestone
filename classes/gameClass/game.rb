require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer, :games

  def initialize(genre, author, source, label, publish_date, last_played_at, archived: false, multiplayer: false)
    super(genre, author, source, label, publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_date = Date.parse(last_played_at)
    current_date = Date.today
    difference = last_played_date - current_date
    super && difference > 2
  end

  
  def to_hash
    {
      archived: @archived,
      author: @author,
      genre: @genre,
      id: @id,
      label: @label,
      last_played_at: @last_played_at,
      multiplayer: @multiplayer,
      publish_date: @publish_date,
      source: @source
    }
  end
end
