ary = ["zero", "one", "two"]
hash = {:zero=>0, :one=>1, :two=>2}
# 最初の要素を変更する。オブジェクトそのものが書き変わる。
ary[0] = "ZERO"
ary   # => ["ZERO", "one", "two"]
# 新たに:three, 3のペアを追加する。
hash[:three] = 3
hash  # => {:zero=>0, :one=>1, :two=>2, :three=>3}
# 要素数を超えたインデックスを指定したら配列はnilで伸長される。
ary[4] = "four"
ary   # => ["ZERO", "one", "two", nil, "four"]
# メソッド呼び出しではあるものの、文法上では代入文扱いされるため多重代入も可能。
ary[3], hash[:three] = ["three", 3]
ary   # => ["ZERO", "one", "two", "three", "four"]
hash  # => {:zero=>0, :one=>1, :two=>2, :three=>3}
# 自己代入も可能。
hash[:zero] += 3
hash  # => {:zero=>3, :one=>1, :two=>2, :three=>3}

