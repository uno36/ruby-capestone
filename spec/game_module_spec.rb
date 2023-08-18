require 'json'
require_relative '../module/game_module'

RSpec.describe GameModule do
  include GameModule

  describe '#add_game' do
    it 'adds a game to the list' do
      # Stubbing user input
      allow(self).to receive(:gets).and_return('false', '0', '01-01-2023')

      # Stubbing methods
      allow(self).to receive(:author_list_display)
      allow(self).to receive(:create_author)
      allow(self).to receive(:fetch_game_data).and_return([])
      allow(self).to receive(:save_game_data)

      add_game
    end
  end

  describe '#author_choice' do
    it 'returns a new author' do
      expect(self).to receive(:create_author).and_return('new_author_data')
      allow(self).to receive(:fetch_author_data).and_return(%w[author1 author2])

      result = author_choice(0)
      expect(result).to eq('author2')
    end

    it 'returns an existing author' do
      allow(self).to receive(:create_author).never
      allow(self).to receive(:fetch_author_data).and_return(%w[author1 author2])

      result = author_choice(2)
      expect(result).to eq('author2')
    end
  end

  describe '#fetch_game_data' do
    it 'returns existing game data' do
      allow(File).to receive(:exist?).with('JSON/game.json').and_return(true)
      allow(File).to receive(:read).with('JSON/game.json').and_return('[{"id": 1}]')

      result = fetch_game_data
      expect(result).to eq([{ 'id' => 1 }])
    end

    it 'returns empty array when no game data' do
      allow(File).to receive(:exist?).with('JSON/game.json').and_return(false)

      result = fetch_game_data
      expect(result).to eq([])
    end
  end

  describe '#save_game_data' do
    it 'saves game data to file' do
      data = [{ 'id' => 1 }]
      file = double('file')
      allow(File).to receive(:open).with('JSON/game.json', 'w').and_yield(file)
      allow(JSON).to receive(:dump).with(data, file)

      save_game_data(data)
    end
  end

  describe '#game_list_display' do
    it 'displays game list' do
      allow(self).to receive(:fetch_game_data).and_return([{ 'id' => 1, 'author' => { 'first_name' => 'John', 'last_name' => 'Doe' }, 'multiplayer' => false,
                                                             'last_played_at' => '01-01-2023' }])

      expected_output = "\nHere is the list of games: \n1) id: 1, Author Name: John Doe, multiplayer: false, Last playing date: 01-01-2023\n"
      expect { game_list_display }.to output(expected_output).to_stdout
    end

    it 'displays no games message' do
      allow(self).to receive(:fetch_game_data).and_return([])

      expected_output = "\nHere is the list of games: \nNo Games found.\n"
      expect { game_list_display }.to output(expected_output).to_stdout
    end
  end
end
