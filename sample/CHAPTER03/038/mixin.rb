module MixInParent
  def parent() :parent end
end
module MixInChild
  include MixInParent
  def child() :child end
end
class Example
  include MixInChild
end

obj = Example.new
obj.child   # => :child
obj.parent  # => :parent
