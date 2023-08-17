require_relative '../classes/Music/genre'

describe 'Testing Music Album functions' do
  before(:each) do
    @new_genre = Genre.new('Tadesse & Omachi & Erik')
  end

  it 'Returns the instance of class' do
    expect(@new_genre).to be_instance_of Genre
  end

  it '' do
    expect(@new_genre.name).to eql 'Tadesse & Omachi & Erik'
  end

  it 'Return the id should be on the range of [1 to 1000]' do
    expect(@new_genre.id).to be_between(1, 1000)
  end
end
