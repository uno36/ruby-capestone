require_relative '../item'

class Book < Item
  attr_accessor :cover_state

  def initialize(genre, author, source, label, publish_date, cover_state, archived: false)
    super(genre, author, source, label, publish_date, archived: archived)
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == "bad"
  end
end
