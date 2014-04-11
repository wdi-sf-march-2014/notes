class Square
  attr_accessor :side

  def initialize(side)
    @side = side
  end

  def area
    @side ** 2
  end

  def perimeter
    @side * 4
  end

  def to_s
    "I am a square. My sides are of length: #{@side}. My area is: #{area}."
  end
end

