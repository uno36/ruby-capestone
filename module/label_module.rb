require 'JSON'
require_relative '../classes/bookClass/label'

module labelModule
  def add_label
    puts "\nHere is the list of labels"
    return if File.exist?('JSON/label.json')
    create_label
  end

  def fetch_label_data
    existing_label = []
    existing_label = JSON.parse(File.read('JSON/label.json')) if File.exist?('JSON/label.json')
    existing_label
  end

  def save_label_data(data)
    File.open('JSON/label.json', 'w') do |file|
      JSON.dump(data, file)
    end
  end

  def label_list_display
    puts "\nHere is the list of labels"
    list = fetch_label_data
    list.each_with_index do |item, index|
      puts "#{index + 1}) id: #{item['id']}, Title: #{item['title']}, Color: #{item['color']}"
    end
  end

  def create_label
    puts 'Label tiele: '
    title = gets.chomp
    puts 'Label color: '
    color = gets.chomp
    label = label.new(title, color).to_hash
    existing_label = fetch_label_data
    existing_label << label
    save_label_data(existing_label)
    puts 'Label has been created successfully!'
  end
end
