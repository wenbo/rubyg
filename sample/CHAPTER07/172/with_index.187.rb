ary = %w[cat echo ls]
# each_with_indexと等価。
ary.each.with_index.to_a                # => [["cat", 0], ["echo", 1], ["ls", 2]]
# インデックスが2以上の要素を取り出す。
ary.select.with_index{|x,i| i>=2}       # => ["ls"]
ary.each_with_index.select{|x,i| i>=2}  # => [["ls", 2]]
