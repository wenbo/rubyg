class Foo
  def private_method_1()  end
  private :private_method_1
end
foo = Foo.new
foo.respond_to? :private_method_1       # => false
foo.respond_to? :private_method_1, true # => true
