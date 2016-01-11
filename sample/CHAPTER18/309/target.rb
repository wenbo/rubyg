class Test
  def doit() @func = :baz;  foo(4)  end
  def foo(a) bar(a+1)               end
  def bar(x) __send__ @funx, x      end
  def baz(x) x*x                    end
end
p Test.new.doit if __FILE__==$0
