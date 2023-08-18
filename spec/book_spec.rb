require_relative '../module/book_module'
require_relative '../classes/bookClass/book'
require 'json'

describe LibraryModule do
  describe '.load_data' do
    context 'when library data file exists' do
      it 'returns the existing library data' do
        existing_data = [{ 'label' => 'Book 1', 'publisher' => 'Publisher 1', 'publish_date' => '2023-01-01', 'cover_state' => 'Good' }]
        allow(File).to receive(:exist?).with(LibraryModule::FILENAME).and_return(true)
        allow(File).to receive(:read).with(LibraryModule::FILENAME).and_return(existing_data.to_json)

        expect(LibraryModule.load_data).to eq(existing_data)
      end
    end

    context 'when library data file does not exist' do
      it 'returns an empty array' do
        allow(File).to receive(:exist?).with(LibraryModule::FILENAME).and_return(false)

        expect(LibraryModule.load_data).to eq([])
      end
    end
  end

  describe '.save_data' do
    it 'saves library data to the JSON file' do
      data = [{ 'label' => 'Book 1', 'publisher' => 'Publisher 1', 'publish_date' => '2023-01-01', 'cover_state' => 'Good' }]
      allow(File).to receive(:write)
      LibraryModule.save_data(data)

      expect(File).to have_received(:write).with(LibraryModule::FILENAME, JSON.pretty_generate(data))
    end
  end
end
