class Game
  attr_reader :computer, :player, :board
  def initialize
    @computer = computer
    @player = player
    @board = Board.new
  end

  def welcome
    greeting = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    puts greeting
    input = gets.chomp

    if input == 'p'
      #start method
    else
      puts "BYE FELICIA!"
    end
  end


end
