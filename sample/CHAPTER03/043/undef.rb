class Super
  def undefined() :undefined_super end
  def removed() :remove_super end
end
class Sub < Super
  def undefined() :undefined_sub end
  def removed() :remove_sub end
  undef undefined               # :undefined�Ȼ��ꤷ�Ƥ�褤
  remove_method :removed
end

sub = Sub.new
sub.undefined rescue $!
# => #<NoMethodError: undefined method `undefined' for #<Sub:0x9ff95ac>>
sub.removed  # => :remove_super
