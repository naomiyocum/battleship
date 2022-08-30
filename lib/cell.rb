class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
  end
  def ship

  end
  def empty?
    if cell.ship == nil
      true
    else
      false
    end
  end
end
