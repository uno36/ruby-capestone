require_relative '../item'

class MusicAlbum < Item
  attr_reader :name, :genre, :archived

  def initialize(name, on_spotify: false, **dummy_args)
    super(*dummy_args.values_at(:genre, :author, :source, :label, :publish_date), archived: dummy_args[:archived])
    @id = Random.rand(1..1000)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived
    parent_result = super
    parent_result && @no_spotify
  end

  def move_to_archived
    super
    @archived = true
  end
end
