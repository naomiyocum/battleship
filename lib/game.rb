class Game
  attr_reader :computer_board, :player_board, :computer_cruiser, :computer_submarine, :player_cruiser, :player_submarine, :first_sample, :poss_sample, :poss_cpu_shot, :given_coor
  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @first_sample = @computer_board.cruiser_coors.sample
    @poss_sample = @computer_board.submarine_coors.sample
    @poss_cpu_shot = @player_board.cells.keys.sample
    @given_coor = 0
  end

  def welcome
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)

    greeting = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    puts greeting
    input = gets.chomp

    if input == 'p'
      computer_setup
      player_setup
      playing
    else
      puts "BYE FELICIA!"
    end
  end

  def computer_setup
    @computer_board.valid_coors_cruiser
    @first_sample = @computer_board.cruiser_coors.sample
    @computer_board.place(@computer_cruiser, @first_sample)
    @computer_board.valid_coors_submarine
    @poss_sample = @computer_board.submarine_coors.sample
    while @computer_board.valid_placement?(@computer_submarine, @poss_sample) == false
    @poss_sample = @computer_board.submarine_coors.sample
    end
    @computer_board.place(@computer_submarine, @poss_sample)
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

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts "#{@computer_board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@player_board.render(true)}"
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    puts ">" + "#{@given_coor = gets.chomp.upcase}"
    while @computer_board.valid_coordinate?(@given_coor) == false
      puts "Please enter a valid coordinate:"
      puts ">" + "#{@given_coor = gets.chomp.upcase}"
    end

    while @computer_board.cells[@given_coor].fired_upon? == true
      puts "You have already fired upon that space, choose again:"
      puts ">" + "#{@given_coor = gets.chomp.upcase}"
    end
    @computer_board.cells[@given_coor].fire_upon
  end

  def computer_shot
    while @player_board.cells[@poss_cpu_shot].fired_upon? == true
      @poss_cpu_shot = @player_board.cells.keys.sample
    end
    @player_board.cells[@poss_cpu_shot].fire_upon
  end

  def player_results
    if @computer_board.cells[@given_coor].ship == nil
      puts "Your shot on #{@given_coor} was a miss."
    elsif @computer_board.cells[@given_coor].ship.sunk? == true
      puts "Your shot on #{@given_coor} sunk my battleship!"
    else
      puts "Your shot on #{@given_coor} was a hit."
    end
  end

  def comp_results
    if @player_board.cells[@poss_cpu_shot].ship == nil
      puts "My shot on #{@poss_cpu_shot} was a miss."
    elsif @player_board.cells[@poss_cpu_shot].ship.sunk? == true
      puts "My shot on #{@poss_cpu_shot} sunk your battleship!"
    else
      puts "My shot on #{@poss_cpu_shot} was a hit."
    end
  end

  def results
    player_results
    comp_results

  end

  def comp_has_lost?
    @computer_cruiser.sunk? == true && @computer_submarine.sunk? == true
  end

  def player_has_lost?
    @player_cruiser.sunk? == true && @player_submarine.sunk? == true
  end

  def playing
    while comp_has_lost? == false && player_has_lost? == false
     display_boards
     player_shot
     computer_shot
     results
    end
    if comp_has_lost? == true
      puts "YOU WON!"
    elsif player_has_lost? == true
      puts "I WON!"
    end
    display_boards
    welcome
  end

end
