class Triangle
  attr_reader :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle

    if a == b && b == c 
      :equilateral
    elsif a == b || a == c || b == c 
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle 
    valid = [(a + b > c), (a + c > b), (b + c > a)]

    [a, b, c].each do |side|
      valid << false if side <= 0
    end

    if valid.include?(false)
      raise TriangleError
    end
  end
  
  
  class TriangleError < StandardError
    def message
      "One side of your triangle is too long!"
    end
  end
end
