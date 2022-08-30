class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(type)
    @ship = type
  end

  def fired_upon?
    if (@ship.name == "Cruiser" && @ship.length < 3) || (@ship.name == "Submarine" && @ship.length < 2)
      true
    else
      false
    end
  end

  def fire_upon
    @ship.hit
  end

end
