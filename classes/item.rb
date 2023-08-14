class Item
  def initialize(id, genre, author, source, label, publish_date, archived: flase)
    @id = Random.rand()
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end


end