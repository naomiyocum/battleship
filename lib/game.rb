class Game
  attr_reader :computer_board, :player_board, :computer_cruiser, :computer_submarine, :player_cruiser, :player_submarine
  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  def welcome
    greeting = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    puts greeting
    input = gets.chomp

    if input == 'p'
      computer_setup
      player_setup
    else
      puts "BYE FELICIA!"
    end
  end

  def computer_setup
    @computer_board.valid_coors_cruiser
    @computer_board.place(@computer_cruiser, @computer_board.cruiser_coors.sample)
    @computer_board.valid_coors_submarine

    poss_sample = @computer_board.submarine_coors.sample
    while @computer_board.valid_placement?(@computer_submarine, poss_sample) == false
      poss_sample = @computer_board.submarine_coors.sample
    end
    @computer_board.place(@computer_submarine, poss_sample)
  end

  def player_setup
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "#{@player_board.render}"
    puts "Enter the squares for the Cruiser (3 spaces):"
    p_valid_cruiser = []
    puts ">"+"#{p_valid_cruiser << gets.chomp}"
    p_valid_cruiser = p_valid_cruiser[0].upcase.split
    while @player_board.valid_placement?(@player_cruiser, p_valid_cruiser) == false
      puts "Those are invalid coordinates. Please try again:"
      p_valid_cruiser = []
      puts ">"+"#{p_valid_cruiser << gets.chomp}"
      p_valid_cruiser = p_valid_cruiser[0].upcase.split
    end
    @player_board.place(@player_cruiser, p_valid_cruiser)

    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    p_valid_submarine = []
    puts ">"+"#{p_valid_submarine << gets.chomp}"
    p_valid_submarine = p_valid_submarine[0].upcase.split
    while @player_board.valid_placement?(@player_submarine, p_valid_submarine) == false
      puts "Those are invalid coordinates. Please try again:"
      p_valid_submarine = []
      puts ">"+"#{p_valid_submarine << gets.chomp}"
      p_valid_submarine = p_valid_submarine[0].upcase.split
    end
    @player_board.place(@player_submarine, p_valid_submarine)
    puts @player_board.render(true)
  end

end
