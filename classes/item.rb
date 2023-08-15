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
    years_since_publish = (current_date - @publish_date) / (365 * 24 * 60 * 60)
    years_since_publish > 10
  end

  def move_to_archived
    if can_be_archived
      @archived = true

    else
      puts 'Item cannot be archived'
    end
  end
end
