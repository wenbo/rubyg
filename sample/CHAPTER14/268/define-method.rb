Object.instance_eval do
  def smeth() :singleton end
  define_method(:imeth) { :instance }
end
Object.smeth      # => :singleton
Object.new.imeth  # => :instance
