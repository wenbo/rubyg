class CM
  def self.private_method1() end
  private_class_method :private_method1
  def self.public_method1() end
  public_class_method :public_method1
end

CM.public_methods(false)  # => [:public_method1, :allocate, :new, :superclass]
CM.private_methods(false) # => [:private_method1, :inherited, :initialize, :initialize_copy]
