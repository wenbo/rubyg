ary = %w[cat echo grep ls]
# 繰り返しメソッドにブロックをつけないとEnumeratorになる。
ary.each_with_index      # => #<Enumerator:0xb7d6f990>
# ((:Enumerable#each_with_index:))はインデックスつきで繰り返すメソッド。どんな値で繰り返されるかは「to_a」メソッドでわかる。
ary.each_with_index.to_a # => [["cat", 0], ["echo", 1], ["grep", 2], ["ls", 3]]
# each_with_indexに((:Enumerable#select:))を適用しする例。
ary.each_with_index.select{|x, i| i >= 2 and x.length >= 3 }.map(&:first) # => ["grep"]
# ((:Enumerable#each_slice:))はN個ずつ組にして繰り返すメソッド。
ary.each_slice(2).to_a   # => [["cat", "echo"], ["grep", "ls"]]
# each_sliceに((:Enumerable#map:))を適用する例。
ary.each_slice(2).map{|a,b| [a,b.upcase] } # => [["cat", "ECHO"], ["grep", "LS"]]
# 文字列をバイト列に変換する例。
"cat".each_byte.to_a                       # => [99, 97, 116]
