def define_a_class
  lvar = 7
  Class.new do
    define_method(:initialize) { @ivar = lvar }
  end
end

DynamicClass = define_a_class  # => DynamicClass
DynamicClass.new               # => #<DynamicClass:0xb7b9b63c @ivar=7>
