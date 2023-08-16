require 'date'

class Item
  attr_accessor :id, :publish_date, :author
  attr_reader :archived

  def initialize(genre, author, source, label, publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  protected

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end
end
