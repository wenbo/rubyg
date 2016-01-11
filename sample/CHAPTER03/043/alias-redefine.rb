class Example
  def foo() :original end       # nodisp
  alias bar foo                 # nodisp
  # ºÆÄêµÁ
  def foo() :redefined end
  alias bar foo # !> discarding old bar
end
obj = Example.new               # nodisp
obj.foo                         # => :redefined
obj.bar                         # => :redefined
