require_relative '../item'
require 'date'

class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(publish_date, on_spotify)
    super(nil, nil, nil, nil, publish_date)
    @id = Random.rand(1..200)
    @on_spotify = on_spotify
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    true if super && on_spotify == true
  end
end
