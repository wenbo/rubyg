class X
  private
  def private_method() :private end
end
x = X.new
x.__send__ :private_method          # => :private
x.instance_eval { private_method }  # => :private
