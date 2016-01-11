class Super
  def self.a_class_method() :class_method end
end
class Sub < Super; end

Super.a_class_method  # => :class_method
Sub.a_class_method    # => :class_method
