ary = ["zero", "one", "two"]
# 配列の最初の要素を取り出す。firstも使える。
ary[0]                    # => "zero"
ary.fetch(0)              # => "zero"
ary.first                 # => "zero"
# 配列の最後の要素を取り出す。負の数を指定すると最後の要素から数える。lastも使える
ary[-1]                   # => "two"
ary.fetch(-1)             # => "two"
ary.last                  # => "two"
# インデックスが1の要素を得る。
ary[1]                    # => "one"
ary.fetch(1)              # => "one"
# 最後から2番目の要素を得る。
ary[-2]                   # => "one"
ary.fetch(-2)             # => "one"
# []で存在しないインデックスを指定するとnilを返す。
ary[999]                  # => nil
# fetchは要素がなければIndexErrorとなる。
ary.fetch(999) rescue $!  # => #<IndexError: index 999 out of array>
# fetchにブロックをつけると要素がない場合に評価される。
ary.fetch(999) {|i| "ary[#{i}] is not found" } # => "ary[999] is not found"

hash1 = {:zero=>0, :one=>1, :two=>2}
hash2 = {0=>"zero", 1=>"one", 2=>"two"}
# ハッシュの値の取り出し。
hash1[:zero]                   # => 0
hash1.fetch(:zero)             # => 0
# 配列同様[]で存在しないキーを指定するとnilを返す。
hash2[:three]                  # => nil
# 見た目は配列と変わらないが、実はハッシュの値の取り出し。
hash2[0]                       # => "zero"
# fetchは配列と同様。キーに対応する値がなく、ブロックも指定されていない場合Ruby 1.8ではIndexErrorが、Ruby 1.9ではKeyError例外が発生する。
hash1.fetch(:three) rescue $!  # => #<KeyError: key not found>
hash1.fetch(:three){|key| "hash1[#{key.inspect}] is not found" }
# => "hash1[:three] is not found"
