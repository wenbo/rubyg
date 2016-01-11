hash = {1=>"one", 2=>"two", 3=>"three"}
# 値からキーへのハッシュを作成する。
hash.invert                     # => {"one"=>1, "two"=>2, "three"=>3}
class Hash
# 値がかぶってしまっている場合に備えるには、自分で「Hash#safe_invert」を定義する。「||=」は左辺が偽のときに初期値を設定する自己代入イディオム。
  def safe_invert()  inject({}) {|h,(k,v)| (h[v]||=[]) << k; h}  end
end
# 「safe_invert」は重複に備えるため、値は配列になる。
{"a"=>false, "b"=>false, "c"=>nil}.safe_invert  # => {false=>["a", "b"], nil=>["c"]}
hash.safe_invert           # => {"one"=>[1], "two"=>[2], "three"=>[3]}
