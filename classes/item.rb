class Item
  def initialize(genre, author, source, label, publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived
    current_date = Time.now
    length_year = current_date - publish_date
    length_year > 10
  end

  def false
    can_be_archived? true
    @archived = true
  end
end
