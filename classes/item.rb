class Item
  def initialize(id, genre, author, source, label, publish_date, archived: false)
    @id = Random.rand()
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end
    def can_be_archived
      current_date= Time.now
      length_year = current_date - publish_date 
      if length_year > 10
        true
      else 
        false
      end
    end

    def move_to_archived
      can_be_archived? true
       @archived = true
    end

end