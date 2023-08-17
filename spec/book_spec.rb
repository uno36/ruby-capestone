require_relative '../classes/bookClass/book'
require_relative '../module/library_module'
require 'json'

describe LibraryModule do  
  before(:each) do
    File.delete(LibraryModule::FILENAME) if File.exist?(LibraryModule::FILENAME)
  end

  describe '.load_data' do
    context 'when JSON file exists' do
      it 'loads data from the JSON file' do
        File.write(LibraryModule::FILENAME, '[{"label": "Test Book"}]')
        expect(LibraryModule.load_data).to eq([{ 'label' => 'Test Book' }])
      end
    end

    context 'when JSON file does not exist' do
      it 'returns an empty array' do
        expect(LibraryModule.load_data).to eq([])
      end
    end
  end

  describe '.save_data' do
    it 'saves data to the JSON file' do
      data = [{ 'label' => 'Test Book' }]
      LibraryModule.save_data(data)
      expect(File.exist?(LibraryModule::FILENAME)).to be true
      expect(File.read(LibraryModule::FILENAME)).to eq(JSON.pretty_generate(data))
    end
  end  
end
