class Board
  attr_reader :cells, :horizontal_coors, :vertical_coors, :cruiser_coors, :submarine_coors

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
     @horizontal_coors = [["A1", "A2", "A3", "A4"], ["B1", "B2", "B3", "B4"], ["C1", "C2", "C3", "C4"], [["D1", "D2", "D3", "D4"]]]
     @vertical_coors = [["A1", "B1", "C1", "D1"], ["A2", "B2", "C2", "D2"], ["A3", "B3", "C3", "D3"], ["A4", "B4", "C4", "D4"]]
     @cruiser_coors = []
     @submarine_coors = []
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def is_consecutive?(coordinates)
    if @horizontal_coors[0].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    elsif @horizontal_coors[1].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    elsif @horizontal_coors[2].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    elsif @horizontal_coors[3].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    else
      false
    end
  end

  def is_consecutively_vertical?(coordinates)
    if @vertical_coors[0].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    elsif @vertical_coors[1].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    elsif @vertical_coors[2].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    elsif @vertical_coors[3].each_cons(coordinates.length).any? do |order|
        coordinates == order
      end
      true
    else
      false
    end
  end

  def free?(coordinates)
    coordinates.each.all? do |coordinate|
      @cells[coordinate].ship == nil
    end
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length && free?(coordinates)
      is_consecutive?(coordinates) || is_consecutively_vertical?(coordinates)
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
   end

  def render(view = nil)
    if view == true
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    else
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    end
  end

  def valid_coors_cruiser
    @vertical_coors[0].each_cons(3) do |group|
      cruiser_coors << group
    end
    @vertical_coors[1].each_cons(3) do |group|
      cruiser_coors << group
    end
    @vertical_coors[2].each_cons(3) do |group|
      cruiser_coors << group
    end
    @vertical_coors[3].each_cons(3) do |group|
      cruiser_coors << group
    end
    @horizontal_coors[0].each_cons(3) do |group|
      cruiser_coors << group
    end
    @horizontal_coors[1].each_cons(3) do |group|
      cruiser_coors << group
    end
    @horizontal_coors[2].each_cons(3) do |group|
      cruiser_coors << group
    end
    @horizontal_coors[3].each_cons(3) do |group|
      cruiser_coors << group
    end
  end

  def valid_coors_submarine
    @vertical_coors[0].each_cons(2) do |group|
      submarine_coors << group
    end
    @vertical_coors[1].each_cons(2) do |group|
      submarine_coors << group
    end
    @vertical_coors[2].each_cons(2) do |group|
      submarine_coors << group
    end
    @vertical_coors[3].each_cons(2) do |group|
      submarine_coors << group
    end
    @horizontal_coors[0].each_cons(2) do |group|
      submarine_coors << group
    end
    @horizontal_coors[1].each_cons(2) do |group|
      submarine_coors << group
    end
    @horizontal_coors[2].each_cons(2) do |group|
      submarine_coors << group
    end
    @horizontal_coors[3].each_cons(2) do |group|
      submarine_coors << group
    end
  end



end
