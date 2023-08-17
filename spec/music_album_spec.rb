require_relative '../classes/Music/music_album'
require 'date'

describe 'Testing Music Album functions' do
  before(:each) do
    @new_album = MusicAlbum.new('13-09-2022', 'y')
  end

  it 'Returns the instance of class' do
    expect(@new_album).to be_instance_of MusicAlbum
  end

  it 'Returns the publish date' do
    expect(@new_album.publish_date.strftime('%d-%m-%Y')).to eql '13-09-2022'
  end

  it 'Returns the archived permission from the parent' do
    expect(@new_album.archived).to eql false
  end

  it 'Return on spotify information' do
    expect(@new_album.on_spotify).to eql 'y'
  end

  it 'Return the id should be on the range of [1 to 1000]' do
    expect(@new_album.id).to be_between(1, 1000)
  end
end
