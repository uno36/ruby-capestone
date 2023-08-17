require_relative '../item'

class Book < Item
  attr_accessor :cover_state

  def initialize(label, publisher, publish_date, cover_state, archived: false)
    super('', '', '', label, publish_date, archived: archived)
    @publisher = publisher.to_s
    @cover_state = cover_state.to_s
  end

  def to_h
    {
      'publisher' => @publisher,
      'label' => @label,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state,
      'archived' => @archived
    }
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
