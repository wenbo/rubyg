str = "string"
hash = {str => :ok}
hash["string"]                     # => :ok
# コピーをfreezeしてキーにしていることがわかる。
hash.keys.first.frozen?            # => true
hash.keys.first.equal? str         # => false
# 元のキーを書き換えても大丈夫！
str.upcase!; str                   # => "STRING"
hash                               # => {"string"=>:ok}
hash["string"]                     # => :ok
# キーそのものを書き換えようとするとエラーになってくれる。
hash.keys.first.upcase! rescue $!  # => #<RuntimeError: can't modify frozen string>
