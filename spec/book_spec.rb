require_relative '../module/book_module'
require_relative '../classes/bookClass/book'

describe LibraryModule do
  let(:test_data) { [{"label" => {"title" => "Book Title"}, "publisher" => "Publisher", "publish_date" => "2023-01-01", "cover_state" => "Good"}] }
  let(:sample_book) { Book.new("Sample Title", "Sample Publisher", "2023-01-01", "Good").to_h }

  before do
    allow(File).to receive(:exist?).and_return(true)
    allow(File).to receive(:read).and_return(test_data.to_json)
    allow(File).to receive(:write)
  end

  describe '.load_data' do
    it 'loads data from JSON file' do
      expect(LibraryModule.load_data).to eq(test_data)
    end
  end

  describe '.save_data' do
    it 'saves data to JSON file' do
      LibraryModule.save_data([sample_book])
      expect(File).to have_received(:write).with(LibraryModule::FILENAME, JSON.pretty_generate([sample_book]))
    end
  end

  describe '.list_all_books' do
    it 'prints a list of all added books' do
      expect { LibraryModule.list_all_books }.to output(/Below is a list of all added books/).to_stdout
    end
  end

  describe '.add_book' do
    it 'adds a book and saves it' do
      LibraryModule.add_book("New Book", "New Publisher", "2023-08-18", "Excellent")
      expect(File).to have_received(:write).with(LibraryModule::FILENAME, JSON.pretty_generate([sample_book]))
    end
  end
end
