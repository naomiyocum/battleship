class Cell
  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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
    @fired_upon
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fired_upon = true
    else
      @fired_upon = true
    end
  end

  def render(arg = false)
    if fired_upon? == false
      '.'
    elsif arg == true && empty? == false && fired_upon? == false
      'S'
    elsif fired_upon? == true && empty? == true
      'M'
    elsif @ship.sunk? == true && fired_upon? == true
      'X'
    elsif fired_upon? == true && empty? == false
      'H'
    end
  end

end
