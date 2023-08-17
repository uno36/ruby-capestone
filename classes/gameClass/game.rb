require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(author, last_played_at, multiplayer, archived: false)
    super('', author, '', '', '', archived: archived)
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
      author: @author,
      id: @id,
      last_played_at: @last_played_at,
      multiplayer: @multiplayer
    }
  end
end
