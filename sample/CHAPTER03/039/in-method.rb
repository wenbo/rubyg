def customize(str)    # 特異メソッドを定義するメソッド
  a = 1
  class << str
    # 特異メソッド定義の外のローカル変数は見えない
    a rescue $! 
    # => #<NameError: undefined local variable or method `a' for #<Class:#<String:0x85fae44>>>
    def category1() self[0,1] end   # 最初の文字
  end
  def str.category2() self[1,1] end # 次の文字
end
item = "EXfoo"
customize(item) 
item.category1  # => "E"
item.category2  # => "X"
