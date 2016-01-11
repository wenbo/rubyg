class Bad
  def initialize(hash) hash.each {|k,v| instance_variable_set("@#{k}",v) } end
end
Bad.new(:foo => 1, :bar => 2)   # => #<Bad:0x8391068 @foo=1, @bar=2>
Bad.new(:foo => 1, :baz => 3)   # => #<Bad:0x8390de8 @foo=1, @baz=3>
