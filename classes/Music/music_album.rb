require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre

  def initialize(on_spotify, publish_date)
    super(nil, nil, nil, nil, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super and !@no_spotify
  end
end
