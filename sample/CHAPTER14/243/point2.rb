class Point2
  def initialize(x,y)
    @x, @y = x, y
  end
  attr_reader :x, :y
  def radius
    Math.hypot(x, y)
  end
end

p = Point2.new(3,4)
p.radius  # => 5.0
