class Foo
  # インスタンスメソッドの場合
  def bar() "Foo#bar" end
  def imeth
    self       # => #<Foo:0xa2b5f20>
    hello      # => [#<Foo:0xa2b5f20>, "Foo#bar"]
  end
  # クラスメソッドの場合
  def self.bar() "Foo.bar" end
  def self.cmeth
    self       # => Foo
    hello      # => [Foo, "Foo.bar"]
  end
end
def bar() "Object#bar" end
def hello
  # どのbarメソッドが呼ばれるだろうか？
  [self, bar]  # => [#<Foo:0xa2b5f20>, "Foo#bar"], [Foo, "Foo.bar"]
end
Foo.new.imeth  # => [#<Foo:0xa2b5f20>, "Foo#bar"]
Foo.cmeth      # => [Foo, "Foo.bar"]

class PrintHack
  def print(*args)  puts(args, "AAARRGH!") end
  def run()         func "output"          end
end
# PrintHack#printが呼ばれてしまう！
def func(str)       print str              end
PrintHack.new.run
# >> output
# >> AAARRGH!
