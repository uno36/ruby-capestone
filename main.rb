require_relative 'app'

class Main
  def initialize
    @app = App.new
    app_intro
  end

  def app_intro
    puts 'Welcome to the our App!'
    loop do
      @app.display_options
      option = take_input
      @app.run(option)

      break if option == 13
    end
  end

  def take_input
    print 'Enter a number: '
    option = gets.chomp.to_i
    until option >= 1 || option <= 13
      puts 'Please enter a number between 1 and 13!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end
end
