class ClassMethodFromInstance
  def self.class_method() :class_method end
  def call_class_method() self.class.class_method end
end
obj = ClassMethodFromInstance.new
obj.call_class_method # => :class_method
obj.class             # => ClassMethodFromInstance
