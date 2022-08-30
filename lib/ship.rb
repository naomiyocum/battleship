class Ship
  attr_reader :name, :length
  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    @length
  end

  def sunk?
    if @length == 0
      true
    else
      false
    end
  end

  def hit
    @length -= 1
  end
end
