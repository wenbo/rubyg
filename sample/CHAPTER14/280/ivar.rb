class A
  instance_variables      # => []
  @class_ivar = 0
  instance_variables      # => [:@class_ivar]
  def initialize() @ivar = 1 end
end
A.instance_variables      # => [:@class_ivar]
A.new.instance_variables  # => [:@ivar]
