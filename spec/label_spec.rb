require_relative '../module/label_module'
require_relative '../classes/bookClass/label'
require 'json'

class TestLabelModule
  extend LabelModule
end

describe LabelModule do
  let(:test_label_module) { TestLabelModule }

  describe '.fetch_label_data' do
    context 'when label data file exists' do
      it 'returns the existing label data' do
        existing_data = [{ 'id' => 1, 'title' => 'Fiction', 'color' => 'Blue' }]
        allow(File).to receive(:exist?).with('JSON/label.json').and_return(true)
        allow(File).to receive(:read).with('JSON/label.json').and_return(existing_data.to_json)

        expect(test_label_module.fetch_label_data).to eq(existing_data)
      end
    end

    context 'when label data file does not exist' do
      it 'returns an empty array' do
        allow(File).to receive(:exist?).with('JSON/label.json').and_return(false)

        expect(test_label_module.fetch_label_data).to eq([])
      end
    end
  end

  describe '.save_label_data' do
    it 'saves label data to the JSON file' do
      data = [{ 'id' => 1, 'title' => 'Fiction', 'color' => 'Blue' }]
      allow(File).to receive(:open).with('JSON/label.json', 'w').and_yield(StringIO.new)
      allow(JSON).to receive(:dump)

      test_label_module.save_label_data(data)

      expect(File).to have_received(:open).with('JSON/label.json', 'w')
      expect(JSON).to have_received(:dump).with(data, instance_of(StringIO))
    end
  end
end
