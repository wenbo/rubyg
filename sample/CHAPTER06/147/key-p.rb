hash = { "one"=>1, "two"=>2 }
# キーを持つかチェックするには「Hash#key?」を使用する。
hash.key? "one"    # => true
hash.key? "three"  # => false
# 「Hash#key?」の典型的な用途は、unlessと併用して値を設定する。
hash["three"]=3 unless hash.key? "three"
hash               # => {"one"=>1, "two"=>2, "three"=>3}
# Hash#key?の逆で値を持つかチェックするには「Hash#value?」を使用する。
hash.value? 1      # => true
hash.value? 4      # => false
