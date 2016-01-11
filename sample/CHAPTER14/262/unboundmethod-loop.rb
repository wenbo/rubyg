class Greeting
  def hi() "Hi!" end
  2.times do
    old = instance_method(:hi)
    undef :hi
    define_method(:hi) do
      old_hi = old.bind(self).call
      "#{old_hi} (redefined by UnboundMethod)"
    end

  end
end
Greeting.new.hi                 # => "Hi! (redefined by UnboundMethod) (redefined by UnboundMethod)"
