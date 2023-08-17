require_relative '../module/author_module'

RSpec.describe AuthorModule do
  include AuthorModule
  describe '#add_author' do
    context 'when JSON file does not exist' do
      before do
        allow(File).to receive(:exist?).with('JSON/author.json').and_return(false)
      end

      it 'calls create_author' do
        expect(self).to receive(:create_author)
        add_author
      end
    end

    context 'when JSON file exists' do
      before do
        allow(File).to receive(:exist?).with('JSON/author.json').and_return(true)
      end

      it 'does not call create_author' do
        expect(self).not_to receive(:create_author)
        add_author
      end
    end
  end

  describe '#fetch_author_data' do
    context 'when JSON file exists' do
      before do
        json_data = '[{"id": 1, "first_name": "John", "last_name": "Doe"}]'
        allow(File).to receive(:exist?).with('JSON/author.json').and_return(true)
        allow(File).to receive(:read).with('JSON/author.json').and_return(json_data)
      end

      it 'returns the parsed JSON data' do
        result = fetch_author_data
        expect(result).to be_an(Array)
        expect(result.size).to eq(1)
        expect(result[0]['first_name']).to eq('John')
      end
    end

    context 'when JSON file does not exist' do
      before do
        allow(File).to receive(:exist?).with('JSON/author.json').and_return(false)
      end

      it 'returns an empty array' do
        result = fetch_author_data
        expect(result).to eq([])
      end
    end
  end

  describe '#save_author_data' do
    context 'when given valid data' do
      before do
        @mock_file = double('file')
        allow(File).to receive(:open).and_yield(@mock_file)
      end

      it 'saves the data to the JSON file' do
        data = [{ 'id' => 1, 'first_name' => 'John', 'last_name' => 'Doe' }]
        expect(@mock_file).to receive(:write).with(JSON.dump(data))
        save_author_data(data)
      end
    end

    context 'when given empty data' do
      before do
        @mock_file = double('file')
        allow(File).to receive(:open).and_yield(@mock_file)
      end

      it 'saves an empty array to the JSON file' do
        data = []
        expect(@mock_file).to receive(:write).with(JSON.dump(data))
        save_author_data(data)
      end
    end
  end

  describe '#author_list_display' do
    context 'when author data is present' do
      before do
        data = [
          { 'id' => 1, 'first_name' => 'John', 'last_name' => 'Doe' },
          { 'id' => 2, 'first_name' => 'Jane', 'last_name' => 'Smith' }
        ]
        allow(self).to receive(:fetch_author_data).and_return(data)
      end

      it 'displays the list of authors' do
        expected_output = "\nHere is the list of authors\n1) id: 1, Author Name: John Doe\n2) id: 2, Author Name: Jane Smith\n"
        expect { author_list_display }.to output(expected_output).to_stdout
      end
    end

    context 'when author data is empty' do
      before do
        data = []
        allow(self).to receive(:fetch_author_data).and_return(data)
      end

      it 'displays a message that no authors are found' do
        expected_output = "\nHere is the list of authors\n"
        expect { author_list_display }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#create_author' do
    let(:dummy_author_data) { [{ 'first_name' => 'John', 'id' => 1, 'last_name' => 'Doe' }] }

    before do
      allow(self).to receive(:fetch_author_data).and_return(dummy_author_data)
    end

    it 'prompts for author details and adds to author list' do
      expect(self).to receive(:puts).with('Author First Name: ')
      expect(self).to receive(:gets).and_return("John\n")

      expect(self).to receive(:puts).with('Author Last Name: ')
      expect(self).to receive(:gets).and_return("Doe\n")

      expect(Author).to receive(:new).with('John', 'Doe').and_return(double(to_hash: { 'first_name' => 'John', 'id' => 2, 'last_name' => 'Doe' }))

      expect(self).to receive(:fetch_author_data).and_return(dummy_author_data)
      expect(self).to receive(:save_author_data).with(dummy_author_data + [{ 'first_name' => 'John', 'id' => 2, 'last_name' => 'Doe' }])

      expect(self).to receive(:puts).with('Author has been created successfully!')

      create_author
    end
  end
end
