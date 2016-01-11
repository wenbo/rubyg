s = "use extend!"
# extendされたオブジェクトはMarshal可能
Marshal.dump s            # => "\004\b\"\020use extend!"
module Extension
  def foo
    :bar
  end
end
s.extend Extension
s.foo                     # => :bar
Marshal.dump s            # => "\004\be:\016Extension\"\020use extend!"
# 正しく復元される
t = Marshal.load Marshal.dump(s)
t.foo                     # => :bar
# 特異メソッドはダメ
def t.singleton() end
Marshal.dump t rescue $!  # => #<TypeError: singleton can't be dumped>
