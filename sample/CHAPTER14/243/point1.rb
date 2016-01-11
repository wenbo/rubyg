class Point1
  def initialize(x,y)
    @x, @y = x, y
    @radius = Math.hypot(x, y)
  end
  attr_reader :x, :y, :radius
end

p = Point1.new(3,4)
p.radius  # => 5.0
