module Baz
  extend self
  def quintuple(x) x*5 end
end
Baz.quintuple 7  # => 35
include Baz
quintuple 3      # => 15
