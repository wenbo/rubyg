class Example
  def initialize(arg) @ivar = arg end
end
e = Example.new 2 # => #<Example:0xb7aeea04 @ivar=2>
e.ivar rescue $!  # => #<NoMethodError: undefined method `ivar' for #<Example:0xb7aeea04 @ivar=2>>
