class Board
  attr_reader :cells

  def initialize
     @cells = {
       "A1" => Cell.new("A1"),
       "A2" => Cell.new("A2"),
       "A3" => Cell.new("A3"),
       "A4" => Cell.new("A4"),
       "B1" => Cell.new("B1"),
       "B2" => Cell.new("B2"),
       "B3" => Cell.new("B3"),
       "B4" => Cell.new("B4"),
       "C1" => Cell.new("C1"),
       "C2" => Cell.new("C2"),
       "C3" => Cell.new("C3"),
       "C4" => Cell.new("C4"),
       "D1" => Cell.new("D1"),
       "D2" => Cell.new("D2"),
       "D3" => Cell.new("D3"),
       "D4" => Cell.new("D4")
     }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def is_consecutive?(coordinates)
    @cells.keys.each_cons(coordinates.length).any? do |order|
      coordinates == order
    end
  end

  def is_consecutively_vertical?(coordinates)
    vertical_coors = ["A1", "B1", "C1", "D1", "A2", "B2", "C2", "D2", "A3", "B3", "C3", "D3", "A4", "B4", "C4", "D4"]
    vertical_coors.each_cons(coordinates.length).any? do |order|
      coordinates == order
    end
  end


  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length
      is_consecutive?(coordinates) || is_consecutively_vertical?(coordinates)
    else
      false
    end
  end




end
