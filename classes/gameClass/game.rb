require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(id, genre, author, source, label, publish_date, last_played_at, archived: false, multiplayer: false)
    super(id, genre, author, source, label, publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_date = Date.parse(last_played_at)
    current_date = Date.today
    difference = last_played_date - current_date
    super && difference > 2
  end
end
