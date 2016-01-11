class Super
  def foo(arg=0) "<#{arg}>" end
end
class Sub < Super
  def foo(arg)
    arg      # => 3
    super    # => "<3>"
    super(1) # => "<1>"
    super 1  # => "<1>"
    super()  # => "<0>"
    arg=10
    super    # => "<10>"
  end
end
Sub.new.foo(3)
