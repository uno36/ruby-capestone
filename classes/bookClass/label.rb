class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_label(item)
    @items << item
    item.label = self
  end

  def to_hash
    { id: @id, title: @title, color: @color }
  end
end
