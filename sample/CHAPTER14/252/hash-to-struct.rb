def Struct(hash)    # ハッシュから構造体を作成する関数
  Struct.new(*hash.keys).new(*hash.values.map{|s| Hash === s ? Struct(s) : s})
end
# {:a =>1, :b => 2}を構造体に変換する。
s1 = Struct :a => 1, :b => 2  # => #<struct a=1, b=2>
# このようにアクセサ経由でアクセスできる。
[ s1.a, s1.b ]                # => [1, 2]
# 既存のメソッド名をキーにしたらアクセサが上書きする。
s2 = Struct :object_id => 1, :class => 2, :find => 3, :map => 4
[ s2.object_id, s2.class, s2.find, s2.map ]  # => [1, 2, 3, 4]
# ネストしたハッシュを与えると、構造体もネストする。
nested = Struct :a => 1, :b => {:c => {:d => 4}}
# => #<struct a=1, b=#<struct c=#<struct d=4>>>
# そのため、メソッドチェーンでネストを辿れる。
nested.b      # => #<struct c=#<struct d=4>>
nested.b.c    # => #<struct d=4>
nested.b.c.d  # => 4
